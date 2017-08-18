require_relative "static_array"
# Uses a StaticArray as its store, initialized to 8
# Capactiy is tracked separately from length so we can knnow when to resize
# Validates indices for bracket methods
# Raises OOB Error for pop
# Resizes when pushing/unshifting on to a full Array
# Resize uses amortization! Creates a new store and copies over all elements
# Shift/Unshift reassigns each values, O(n)!!

class DynamicArray
  attr_reader :length

  def initialize(capacity=8)
    @capacity = capacity
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @store[(@length) % capacity]
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @length += 1
    @store[@length-1] = val
    nil
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0

    first = @store[0]
    (1..length).each { |i| self[i - 1] = self[i]}
    @start_idx = (start_idx + 1) % @capacity
    @length -= 1
    first
  end


  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @capacity == @length
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
    @length += 1
    self

    ## reSIZE IF LENGTH == capacity
    self.length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index > 0) && (index < @length)
      raise 'index out of bounds'
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    # store_holder = @store
    # p store_holder
    # @capacity = @capacity * 2
    # @start_idx = 0

    # @store = StaticArray.new(@capacity)
    # (0..@capacity).each do |el|
    #   @store[i] = store_holder[i]
    # end
    # @store

    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times { |i| new_store[i] = self[i]}

    @capacity = new_capacity
    @store = new_store
  end

end

require_relative "static_array"
require "byebug"

class RingBuffer
  attr_reader :length

  def initialize(capacity=8)
    @capacity = capacity
    @length = 0
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    # raise 'index out of bounds' if index >= @length
    # @store[index]
    check_index(index)
    store[(start_idx + index)% capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0

    val, @store[@length - 1] = @store[length -1], nil 
    @length -= 1

    val
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == capacity
    @length += 1 
    @store[@length-1] = val

    nil
  end

  # O(1)
  def shift
    raise "index of bound" if (length == 0) 

    val, @store[0] = @store[0], nil 
    @start_idx = (start_idx + 1) % capacity 
    @length -= 1 

    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if self.length == self.capacity

    self.start_idx = (self.start_idx - 1) % self.capacity
    self.length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0 ) && ( index < length)
      raise "index out of bounds"
    end 
  end

  def resize!
    
  end
end

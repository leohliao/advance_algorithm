# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

# On enqueue we will psuh the new element into our maxque (as well as
# the store, clearly) and eject all elements (from the back) that are
#less than the new element, until we hit one that is greater or eqaul;
#these ejected elements will never be the max because they will be
#dequeued from the the main store before this new element. Notice that
#each element is only pushed or ejected onto maxque once, so time
#complexity amortizes. We never have to consider n elements over and
#over again because an element is either ejected or causes early stopping.

# On dequeue from the store, we will shoft off from the maxque if it
# matches the element being dequeued; if it mataches, we are lsoing a
# current max, and must take it off the list.


require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @Rstore = RingBuffer.new
    @maxque = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)
    update_maxque(val)
  end

  def dequeue
    val = @store.shift
    @maxqueu.shift if val == maxqueu[0]
    val
  end

  def max
    @maxque[0] if @maxque.length > 0
  end

  def update_maxque(el)
    while @maxque[0] && @maxqueu[@maxque.length - 1] < el
      @maxque.pop
    end
    @maxque.push(el)
  end

  def length
    @store.length
  end

end

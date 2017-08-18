require_relative "heap"

class Array
  def heap_sort!

    2.upto(count).each do |heap_sz|
      Binary.MinHeap.heapify_up(self, heap_sz - 1, heap_sz)

      count.downto(2).each do |heap_sz|
        self[heap_sz - 1], self[0] = self[0], self[heap_sz -1]
        BinaryMinHeap
  end

  # def parent(idx)
  #   ((idx - 1)) / 2
  # end
  #
  # def child(idx, order=1)
  #    return 2 * (idx) - 1
  # end
end

# build a heap in place one element at a time from the left
# by using a pointer to control the size of the heap and heapifying
# that portion after moving the pointer each time.

# maintain a pointer to spearate the sorted part tot eh right from the
# heap to the left.

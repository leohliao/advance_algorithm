## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.

require_relative "heap"

def five_hundred_files(arr_of_arrs)
  # what is the native solution? # Time complexity?
  # What property of the inputs would we like to take advantage of?
  # how can heaps help?

  #Solution
  # Native solution: concatenate all arrays and sort:
  # O (n log(n))
  # All inputs are already sorted: this means that the next element
  # we want to add to our output is always among the first elements
  # of the inputs.
  # MinHeap consisting of the first elements will let us always extract
  # the minimum element in log(k) time, where k is the number of input
  # files
  # key sub-problem: How to keep track of which file the extracted element
  # orginiated from so that we can push the next element from that file onto
  # our heap.

  prc = Proc.new { |x, y| x <=> y }
  heap = BinaryMinHeap.new(&prc)
  result = []

  arr_of_arrs.length.times do |i|
    heap.push([arr_of_arrs][i][0], i, 0)
  end

  while heap.count > 0
    min = heap.extract
    result << min[0]

    next_arr = min[1]
    next_idx = min[2] + 1
    next_el = arr_of_arrs[next_arr_i][next_idx]

    heap.push([next_el, next_arr_i, next_idx]) if next_el
  end
  result

end

arr_of_arrs = [[3,5,7], [0,6], [0,6,20]]
p five_hundred_files(arr_of_arrs)

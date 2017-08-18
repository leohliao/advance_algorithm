require_relative 'heap'

def k_largest_elements(array, k)
  # n * log K times
  # why are heaps implicated in this problem?
  # what are the benefits of the implementing a heap?
  # 1st, build a min heap that is the size of the set we would like to return
  # Then, by consistenly ejecting the minimum element every time we
  # push another element onto the heap, we can be sure

  result = BinaryMinHeap.new
  k.times do
    result.push(array.pop)
  end
  until array.empty?
    result.push(array.pop)
    result.extract
  end
  result.store

end

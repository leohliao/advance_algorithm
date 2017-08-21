=begin
Quick sort time complexity
average case O(nlogn)
worse case O(n**2)

Base Case
- return if length  <= 1

Step 1
select pivot (random element) for n log n

Step 2
partition array around pivot

Step 3
recursive on left or right

#Notes
Using n additional space, which is nlog n space Worst case is n2,
if you're only able to "knock off" one element at a time
- base case: return arr if arr.length <= 1
- pick a pivot element (usually the first)
- make a sub-array of all the elements less than the pivot_el
- make a sub-array of all the elements greater than than the pivot_el
- joint the recursive sort of L with pivot_el with recursive sort of R
- average case is O (n log n), worst case is O(n^2), why?
=end

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array.shift
    left, right = array.partition { |el| pivot <= el }
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  # rather than making new sub-arrays, we will rely on a paritition method
  # that is passed the whole array (along with bounds), and rearranges a
  # subset of element
  # around a pivot_el(which can be randomized)

  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return array if length <= 1
    pivot = partition(array, start, length, &prc)

    left_length = pivot - start
    right_length = pivot - (left_length + 1)

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot + 1, right_length, &prc)
    array
  end

  def self.partition(array, start, length, &prc)

    # new_pivot = start + rand(length)
    # array[start] = array[new_pivot]
    # array[new_pivot] = array[start]

    # pivot_idx = start
    # pivot = array[start]
    # ((start + 1)...(start + length)).each do |idx|
    #   if prc.call(pivot, array[idx] > 0)
    #     array[idx + 1], array[idx] = array[idx], array[idx+1]
    # pivot_ide += 1
    # end


    prc ||= Proc.new { |x, y| x <=> y }

    pivot = start

    ((start + 1)..(start + length - 1)).each do |i|
      if prc.call(array[start], array[i]) > 0
        array[i], array[pivot + 1] = array[pivot + 1], array[i]
        pivot += 1
      end
    end
    array[start], array[pivot] = array[pivot], array[start]
    pivot
  end
end

=begin
Write an in-place instance method on the Array classa that will find
the kth smallest element in O(n) time. You will likely want to use a
partitition method similar to if not exaclt the same as that which you
used for QuickSort! For a bonus, how can we eliminate any extra space cost?
NB: 1st smallest is the O-th element in a sorted array.
=end

def select_kth_smallest(k)
  left = 0
  right = self.length - 1
  while true
    return self[left] if left == right
    pivot_idx = Array.partition(self, left, right-left + 1)
    if k -1 == pivot_idx
      return self[k-1]
    elsif k-1 < pivot_idx
      right = pivot_idx - 1
    else
      left = pivot_idx + 1
    end
  end
end

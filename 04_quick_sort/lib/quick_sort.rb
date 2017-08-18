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
=end

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return array if length <= 1
    pivot = partition(array, start, length, &prc)

    sort2!(array, start, pivot - start, &prc)
    sort2!(array, pivot + 1, length - (pivot - start + 1), &prc)
    array
  end

  def self.partition(array, start, length, &prc)
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

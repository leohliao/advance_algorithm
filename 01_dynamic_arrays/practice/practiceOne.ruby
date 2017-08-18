# Single Element In a Sorted Array
#
# Given a sorted array consisting of only integers where every element
# appears twice except for one element which appears once. Find this
# single element that appears only once. Do it in O(log n) time and O(1)
# space!
#
# things you should be thinking of:
# - O(log n) should immediately make you think of Binary Search.
# - What condition are we checking for?
# - How do we know which direction to go next?

# example: [ 1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 7 ]
#
# solution:
def single_in_sorted(arr)
  lo = 0
  hi = (arr.length - 1)

  while lo < hi
    mid = ((hi - lo) / 2 )+ lo
    return arr[mid] if arr[mid] != arr[mid-1] && arr[mid] != arr[mid + 1 ]
      if (arr[mid] == arr[mid-1] && mid.odd?) || (arr[mid] == arr[mid+1] && mid.even?)
        low = mid + 1
      else
        hi = mid -1
      end
  end

  arr[lo]
end

#Time complexity = O(log n)

p single_in_sorted([1,1,2,2,3,3,4,5,5,6,6,7,7])

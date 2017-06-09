# Problem:
# given an array of positive and negative integers, find the largest continuous sum.

def large_cont_sum(arr)

  # 1. Edge case: check if length is zero
  if arr.count == 0
    return 0
  end

  # 2. Set max_sum and current_sum to the first array element
  max_sum = current_sum = arr[0]

  # 3. Loop through the array starting from index 1
  arr[1..-1].each do |num|

    # 4. Set current_sum to the larger of (current_sum + num) or num
    current_sum = [current_sum + num, num].max()

    # 5. Set max_sum to the larger of the current_sum or max_sum
    max_sum = [current_sum, max_sum].max()

  end
  # 6. Return the max sum
  puts max_sum

end

large_cont_sum([1,2,-1,3,4,10,10,-10,-1])

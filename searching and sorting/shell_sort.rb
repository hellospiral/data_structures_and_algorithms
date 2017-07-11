def shell_sort(arr)

  # get split point
  sublist_count = arr.length / 2

  # while split point > 0, loop to split point and pass arr, "start", and split point into gap_insertion_sort
  while sublist_count > 0
    (0...sublist_count).each do |start|
      gap_insertion_sort(arr, start, sublist_count)
    end

    # after each loop divide sublist_count in half
    sublist_count /= 2
  end
  # return array
  arr
end

def gap_insertion_sort(arr, start, gap)

  # loop over half the array
  ((start+gap)...arr.length).each do |i|
    current_value = arr[i]
    position = i

    # compare elements gap distance apart
    while position >= gap and arr[position - gap] > current_value
      # swap values of out of order elements
      arr[position] = arr[position - gap]
      position = position - gap
    end
    arr[position] = current_value
  end
end

shell_sort([5,1,4,3,2])

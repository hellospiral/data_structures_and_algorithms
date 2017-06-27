def shell_sort(arr)

  sublist_count = arr.length / 2

  while sublist_count > 0
    for start in 0...sublist_count
      gap_insertion_sort(arr, start, sublist_count)
    end

    sublist_count = sublist_count / 2
  end
  arr
end

def gap_insertion_sort(arr, start, gap)

  for i in start + gap...arr.length
    current_value = arr[i]
    position = i

    while position >= gap and arr[position - gap] > current_value
      arr[position] = arr[position-gap]
      position = position - gap
    end
    arr[position] = current_value
  end
end

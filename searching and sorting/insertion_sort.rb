def insertion_sort(arr)

  for i in 1...arr.length
    current_value = arr[i]
    position = i

    while position > 0 and arr[position-1] > current_value
      arr[position] = arr[position-1]
      position = position-1
    end

    arr[position] = current_value
  end
  arr
end

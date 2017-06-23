def selection_sort(arr)

  for fill_slot in 0...arr.length
    min_position = fill_slot

    for location in (fill_slot+1)...arr.length
      if arr[location] < arr[min_position]
        min_position = location
      end
    end

    temp = arr[fill_slot]
    arr[fill_slot] = arr[min_position]
    arr[min_position] = temp
  end

  arr
end

def bubble_sort(arr)

  swapped = true
  length = arr.length
  while swapped
    length -= 1
    swapped = false
    for i in 0...length
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
  end
  return arr
end

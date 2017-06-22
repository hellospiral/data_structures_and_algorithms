def bubble_sort(arr)

  sorted = false
  while !sorted
    sorted = true
    for i in 0...arr.length-1
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
    end
  end
  return arr
end

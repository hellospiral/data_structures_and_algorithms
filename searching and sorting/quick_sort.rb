def quick_sort(arr)
  quick_sort_help(arr, 0, arr.length-1)
  return arr

end

def quick_sort_help(arr, first, last)
  if first < last

    split_point = partition(arr, first, last)

    quick_sort_help(arr, first, split_point-1)
    quick_sort_help(arr, split_point+1, last)
  end
end

def partition(arr, first, last)
  pivot_value = arr[first]

  left_mark = first+1
  right_mark = last

  done = false

  while not done

    while left_mark <= right_mark and arr[left_mark] <= pivot_value
      left_mark += 1
    end

    while arr[right_mark] >= pivot_value and right_mark >= left_mark
      right_mark -= 1
    end

    if right_mark < left_mark
      done = true
    else
      temp = arr[left_mark]
      arr[left_mark] = arr[right_mark]
      arr[right_mark] = temp
    end
  end
  temp = arr[first]
  arr[first] = arr[right_mark]
  arr[right_mark] = temp
  return right_mark
end

def quicksort(array)
  if array.length <= 1
    return array
  else
    pivot = array.sample
    array.delete_at(array.index(pivot)) # remove pivot
    less = []
    greater = []

    array.each do |x|
      if x <= pivot
        less << x
      else
        greater << x
      end
    end

    sorted_array = []
    sorted_array << quicksort(less)
    sorted_array << pivot
    sorted_array << quicksort(greater)

    sorted_array.flatten!
  end
end

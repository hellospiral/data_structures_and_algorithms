def binary_search(arr, ele)
  # array must already be sorted

  first = 0
  last = arr.length - 1
  found = false

  while first <= last and not found
    mid = (first + last) / 2

    if arr[mid] == ele
      found = true
    else
      # decide to use left or right half of list
      if ele < arr[mid]
        last = mid - 1
      else
        first = mid + 1
      end
    end
  end

  return found
end

def rec_bin_search(arr, ele)
  # array must already be sorted

  if arr.length == 0
    return false
  else

    mid = arr.length / 2

    if arr[mid] == ele
      return true
    else
      if ele < arr[mid]
        return rec_bin_search(arr[0..mid], ele)
      else
        return rec_bin_search(arr[mid+1..-1], ele)
      end
    end
  end
end

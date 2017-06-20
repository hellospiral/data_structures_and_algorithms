def seq_search(arr, element)

  arr.each do |item|
    if item == element
      return true
    end
  end

  return false
end

def ordered_seq_search(arr, element)
  # Input array must be ordered/sorted

  arr.each do |item|
    if item == element
      return true
    elsif item > element
      return false
    end
  end

  return false
end

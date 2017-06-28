def merge_sort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left = list[0, mid]
  right = list[mid, list.size]
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted.push(left.shift)
    else
      sorted.push(right.shift)
    end
  end
  sorted.concat(left).concat(right)
end

merge_sort([5,4,3,2,1])

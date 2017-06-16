# Problem: Given a binary tree, check whether it's a binary search tree or not.

def bst_check_2(tree)

  current = tree

  if current.left_child && current.right_child
    if current.left_child.key >= current.key || current.right_child.key <= current.key
      return false
    end
    unless bst_check_2(current.left_child) && bst_check_2(current.right_child)
      return false
    end

  elsif current.left_child
    if current.left_child.key >= current.key
      return false
    end
    unless bst_check_2(current.left_child)
      return false
    end
    
  elsif current.right_child
    if current.right_child.key <= current.key
      return false
    end
    unless bst_check_2(current.right_child)
      return false
    end
  end

  return true
end

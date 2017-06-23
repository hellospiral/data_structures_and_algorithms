# Problem: Given a binary tree, check whether it's a binary search tree or not.

def bst_check(tree)
  unless tree
    return
  end

  if tree.left_child
    if tree.left_child.key >= tree.key || bst_check(tree.left_child) == false
      return false
    end
  end

  if tree.right_child
    if tree.right_child.key <= tree.key || bst_check(tree.right_child) == false
      return false
    end
  end
  return true
end

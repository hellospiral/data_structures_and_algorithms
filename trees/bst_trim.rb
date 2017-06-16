# Trim a Binary Search Tree

# Given the root of a binary search tree and 2 numbers min and max, trim the tree such that all the numbers in the new tree are between min and max (inclusive). The resulting tree should still be a valid binary search .

def trim_bst(tree, min_val, max_val)
  unless tree
    return
  end

  tree.left = trim_bst(tree.left, min_val, max_val)
  tree.right = trim_bst(tree.right, min_val, max_val)

  if tree.data >= min_val && tree.data <= max_val
    return tree
  end

  if tree.data < min_val
    return tree.right
  end

  if tree.data > max_val
    return tree.left
  end
end

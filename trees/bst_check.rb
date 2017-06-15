# Problem: Given a binary tree, check whether it's a binary search tree or not.

def bst_check(tree)

  current = tree.root

  if current.left.data == nil && current.right.data == nil
    return false
  end

  if current.left
    while current.left do
      if current.left.data >= current.data
        return false
      end
      current = current.left
    end
  end

  current = tree.root

  if current.right
    while current.right do
      if current.right.data <= current.data
        return false
      end
      current = current.right
    end
  end

  return true
end

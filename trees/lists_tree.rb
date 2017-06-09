# implementing a tree as a list of lists
def binary_tree(r)
  return [r, [], []]
end

def insert_left(root, new_branch)
  branch = root[1]

  if branch.length > 1
    root[1] =  [new_branch, branch, []]
  else
    root[1] = [new_branch, [], []]
  end

  return root
end

def insert_right(root, new_branch)
  branch = root[2]

  if branch.length > 1
    root[2] = [new_branch, [], branch]
  else
    root[2] = [new_branch, [], []]
  end

  return root
end

def get_root_val(root)
  return root[0]
end

def set_root_val(root, new_val)
  root[0] = new_val
end

def get_left_child(root)
  return root[1]
end

def get_right_child(root)
  return root[2]
end

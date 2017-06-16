# Tree Level Order Print
# Given a binary tree of integers, print it in level order. The output will contain space between the numbers in the same level, and new line between different levels.

def level_order_print(tree)
  unless tree
    return
  end

  nodes = [tree]
  current_line_count = 1
  next_line_count = 0

  while nodes.length != 0
    current_node = nodes.shift
    current_line_count -= 1
    print current_node.key.to_s + ' '
    if current_node.left_child
      nodes.push(current_node.left_child)
      next_line_count += 1
    end
    if current_node.right_child
      nodes.push(current_node.right_child)
      next_line_count += 1
    end
    if current_line_count == 0
      # finished printing current level
      puts ''
      current_line_count = next_line_count
      next_line_count = current_line_count
    end
  end
end

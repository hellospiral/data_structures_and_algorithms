# Reverse a linked list
def reverse(head)
  node = head

  stack = []

  while node != nil do
    stack.push(node)
    node = node.nextnode
  end

  node = stack.pop

  while stack.count > 0 do
    prev_node = stack.pop
    node.nextnode = prev_node
    node = prev_node
  end
  head.nextnode = nil
end

# Reverse a linked list in place

def reverse_2(head)
  current = head
  previous = nil
  next_node = nil

  while current do
    # copy current.nextnode to variable
    next_node = current.nextnode
    current.nextnode = previous
    previous = current
    current = next_node
  end

  return previous

end

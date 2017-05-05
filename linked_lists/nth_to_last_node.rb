# Linked List Nth to Last Node
# Write a function that takes a head node and an integer value n and then returns the nth to last node in the linked list

def nth_to_last_node(n, head)
  current = head
  # count total number of nodes
  counter = 1
  until current == nil do
    counter += 1
    current = current.nextnode
  end

  # subtract n from count
  diff = counter - n

  # loop again, stop when counter == diff, return element
  counter = 1
  current = head

  until counter == diff do
    current = current.nextnode
    counter += 1
  end

  return current
end

def nth_to_last_node_2(n, head)

  # set left_pointer and right_pointer to head
  left_pointer = head
  right_pointer = head

  # set right_pointer to be n-1 ahead of left_pointer
  n-1.times do
    if right_pointer.nextnode == nil
      return 'Error: n is larger than linked list'
    end
    right_pointer = right_pointer.nextnode
  end

  # move the "block" along until it reaches the end of the list and return left_pointer
  while right_pointer.nextnode do
    left_pointer = left_pointer.nextnode
    right_pointer = right_pointer.nextnode
  end

  return left_pointer
end

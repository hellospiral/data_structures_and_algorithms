# Problem:
# Given a singly linked list, write a function which takes in the first node in a singly linked list and returns a boolean indicating if the linked list contains a "cycle".
#
# A cycle is when a node's next point actually points back to a previous node in the list. This is also sometimes known as a circularly linked list.

class Node
  attr_accessor :value, :nextnode

  def initialize(value)
    @value = value
    @nextnode = nil
  end
end

def cycle_check(node)
  i = node
  while i.nextnode != nil do
    i = i.nextnode
    if i == node
      return true
    end
  end
  return false
end

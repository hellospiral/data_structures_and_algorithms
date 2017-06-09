#singly linked list implementation
class Node
  attr_accessor :value, :nextnode

  def initialize(value)
    @value = value
    @nextnode = nil
  end
end

class DoublyLinkedListNode
  attr_accessor :value, :next_node, :prev_node

  def initialize(value)
    @value = value
    @next_node = nil
    @prev_node = nil
  end
end

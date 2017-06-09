class Node
  attr_accessor :element, :next, :prev

  def initialize(element)
    @element = element
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList
  attr_accessor :head

  def initialize
    @head = Node.new('head')
  end

  def insert(new_element, item)
    new_node = Node.new(new_element)
    current = find(item)
    new_node.next = current.next
    new_node.prev = current
    current.next = new_node
  end

  def find(element)
    current = @head
    while current.element != element do
      current = current.next
    end
    return current
  end

  def remove(element)
    current = find(element)
    if current.next != nil
      current.prev.next = current.next
      current.next.prev = current.prev
      current.next = nil
      current.prev = nil
    end
  end

  def find_last
    current = @head
    until current.next == nil do
      current = current.next
    end
    return current
  end

  def display
    current = @head
    until current.next == nil do
      puts current.next.element
      current = current.next
    end
  end

  def display_reverse
    current = find_last
    until current.prev == nil do
      puts current.element
      current = current.prev
    end
  end
end

cities = DoublyLinkedList.new
cities.insert('Conway', 'head')
cities.insert('Russellville', 'Conway')
cities.insert('Carlisle', 'Russellville')
cities.insert('Alma', 'Carlisle')
cities.display
cities.remove('Carlisle')
cities.display
cities.display_reverse

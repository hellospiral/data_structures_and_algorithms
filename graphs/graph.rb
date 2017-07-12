require 'orderedhash'

module State
  UNVISITED = 0
  VISITING = 1
  VISITED = 2
end

class Node
  attr_reader :visit_state, :adjacent

  def initialize(num)
    @num = num
    @visit_state = State::UNVISITED
    @adjacent = OrderedHash.new # key = node, value = weight
  end

  def to_string
    "#{@num}"
  end
end

class Graph
  attr_reader :nodes

  def initialize
    @nodes = OrderedHash.new
  end

  def add_node(num)
    node = Node.new(num)
    @nodes[num] = node
    node
  end

  def add_edge(source, destination, weight = 0)

    unless @nodes.include?(source)
      add_node(source)
    end

    unless @nodes.include?(destination)
      add_node(destination)
    end
    @nodes[source].adjacent[@nodes[destination]] = weight
  end
end

class Vertex
  attr_reader :id

  def initialize(key)
    @id = key
    @connected_to = {}
  end

  def add_neighbor(neighbor, weight = 0)
    @connected_to[neighbor] = weight
  end

  def get_connections
    @connected_to.keys
  end

  def get_weight(neighbor)
    @connected_to[neighbor]
  end

  def print_connections
    output = @id.to_s + ' connected to '
    @connected_to.keys.each do |vertex|
      output += vertex.id.to_s + ' '
    end
    output
  end

  def to_string
    "#{@id} is connected to #{get_connections}"
  end
end

class Graph
  include Enumerable

  def initialize
    @vertices_list = {}
    @num_vertices = 0
  end

  def each(&block)
    @vertices_list.values.each do |vertex|
      block.call(vertex)
    end
  end

  def add_vertex(key)
    @num_vertices += 1
    new_vertex = Vertex.new(key)
    @vertices_list[key] = new_vertex
    new_vertex
  end

  def get_vertex(key)
    @vertices_list[key] || nil
  end

  def add_edge(from, to, cost = 0)
    unless @vertices_list.include?(from)
      new_vertex = add_vertex(from)
    end

    unless @vertices_list.include?(to)
      new_vertex = add_vertex(to)
    end

    @vertices_list[from].add_neighbor(@vertices_list[to], cost)
  end

  def get_vertices
    @vertices_list.keys
  end

  def contains?(target)
    @vertices_list.include?(target)
  end
end

# Create graph and add vertices

g = Graph.new

6.times do |i|
  g.add_vertex(i)
end

g.add_edge(0, 1, 2)

g.each do |vertex|
  p vertex.to_string
end

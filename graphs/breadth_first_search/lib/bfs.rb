class BreadthFirstSearch

  def initialize(graph, source_node)
    @graph = graph
    @node = source_node
    @visited = []
    @edge_to = {}

    bfs(source_node)
  end

  def shortest_path_to(node)
    return unless has_path_to?(node)
    path = []

    while node != @node
      path.unshift(node)
      node = @edge_to[node]
    end

    path.unshift(@node)
  end

  private
  def bfs(node)

    # 1. Put the source node into a queue and mark it as visited
    queue = []
    queue << node
    @visited << node

    # 2. Repeat until queue is empty:
    # - Remove the least recently added node n
    # - add each of n's unvisited adjacents to the queue and mark them as visited
    while queue.any?
      current_node = queue.shift
      current_node.adjacents.each do |adjacent_node|
        next if @visited.include?(adjacent_node)
        queue << adjacent_node
        @visited << adjacent_node
        @edge_to[adjacent_node] = current_node
      end
    end
  end

  def has_path_to?(node)
    @visited.include?(node)
  end
end

class DepthFirstSearch

  def initialize(graph, source_node)
    @graph = graph
    @source_node = source_node
    @visited = []
    @edge_to = {}

    dfs(source_node)
  end

  # After DFS is done we can find any vertice connected to "node" in constant time, and find a path to this node in linear time

  def path_to(node)
    return unless has_path_to?(node)
    path = []
    current_node = node

    while current_node != @source_node
      path.unshift(current_node)
      current_node = @edge_to[current_node]
    end

    path.unshift(@source_node)
  end

  private

  def dfs(node)
    @visited << node
    node.adjacents.each do |adj_node|
      next if @visited.include?(adj_node)

      dfs(adj_node)
      @edge_to[adj_node] = node
    end
  end

  def has_path_to?(node)
    @visited.include?(node)
  end
end

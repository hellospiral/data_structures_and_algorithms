require 'rspec'

require 'graph'
require 'node'
require 'bfs'

describe BreadthFirstSearch do
  node1 = Node.new("Node #1")
  node2 = Node.new("Node #2")
  node3 = Node.new("Node #3")
  node4 = Node.new("Node #4")
  node5 = Node.new("Node #5")

  graph = Graph.new
  graph.add_edge(node1, node2)
  graph.add_edge(node2, node3)
  graph.add_edge(node2, node4)
  graph.add_edge(node4, node5)
  graph.add_edge(node1, node5)

  describe '#shortest_path_to' do
    it 'returns the shortest path between two nodes' do
      path = BreadthFirstSearch.new(graph, node1)
      expect(path.shortest_path_to(node5)).to eq([node1, node5])
    end

    it 'returns the shortest path between two nodes' do
      path = BreadthFirstSearch.new(graph, node1)
      expect(path.shortest_path_to(node3)).to eq([node1, node2, node3])
    end
  end
end

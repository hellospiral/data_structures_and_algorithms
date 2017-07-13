require 'set'

def bfs(graph, start)
  visited = Set.new
  queue = [start]

  while queue.any?
    vertex = queue.shift
    if not visited.include?(vertex)
      visited.add(vertex)
      graph[vertex.to_sym].each do |node|
        unless visited.include?(node)
          queue << node
        end
      end
    end
  end
  visited
end

# testing
graph = {'A': Set.new(['B', 'C']),
         'B': Set.new(['A', 'D', 'E']),
         'C': Set.new(['A', 'F']),
         'D': Set.new(['B']),
         'E': Set.new(['B', 'F']),
         'F': Set.new(['C', 'E'])
}
bfs(graph, 'A')

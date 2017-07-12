require 'set'

def dfs(graph, start, visited = nil)

  unless visited
    visited = Set.new
  end
  visited.add(start)
  (graph[start.to_sym]-visited).each do |nxt|
    dfs(graph, nxt, visited)
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
dfs(graph, 'A')

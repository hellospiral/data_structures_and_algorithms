require 'set'

class Node
  attr_accessor :key, :adjacents

  def initialize(key)
    @key = key
    @adjacents = Set.new
  end

  def edge_to?(node)
    @adjacents.include?(node)
  end
end

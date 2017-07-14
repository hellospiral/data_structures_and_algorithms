require 'set'

class Node
  attr_accessor :name, :adjacents

  def initialize(name)
    # use a Set to avoid duplicate connections
    @adjacents = Set.new
    @name = name
  end
end

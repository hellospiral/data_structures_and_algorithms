class Stack
  def initialize
    @items = []
  end

  def isEmpty?
    @items == []
  end

  def push(item)
    @items.push(item)
  end

  def pop
    @items.pop
  end

  def peep
    @items[@items.length - 1]
  end

  def size
    @items.length
  end
end

class Queue
  def initialize
    @items = []
  end

  def isEmpty?
    @items == []
  end

  def enqueue(item)
    @items.push(item)
  end

  def dequeue
    @items.shift
  end

  def size
    return @items.length
  end

end

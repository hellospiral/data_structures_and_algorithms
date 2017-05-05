class Deque
  def initialize
    @items = []
  end

  def is_empty?
    @items == []
  end

  def size
    return @items.length
  end

  def add_rear(item)
    @items.push(item)
  end

  def add_front(item)
    @items.unshift(item)
  end

  def remove_rear
    @items.pop
  end

  def remove_front
    @items.shift
  end
end

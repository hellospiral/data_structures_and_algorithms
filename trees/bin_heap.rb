class BinaryHeap
  attr_accessor :heap_list, :current_size

  def initialize
    @heap_list = [0]
    @current_size = 0
  end

  def perc_up(i)
    while i / 2 > 0 do
      if self.heap_list[i] < self.heap_list[i / 2]
        tmp = self.heap_list[i / 2]
        self.heap_list[i / 2] = self.heap_list[i]
        self.heap_list[i] = tmp
      end
      i = i / 2
    end
  end

  def insert(k)
    self.heap_list.push(k)
    self.current_size += 1
    self.perc_up(self.current_size)
  end

  def perc_down(i)
    while (i * 2) <= self.current_size do
      min_child = self.min_child(i)
      if self.heap_list[i] > self.heap_list[min_child]
        tmp = self.heap_list[i]
        self.heap_list[i] = self.heap_list[min_child]
        self.heap_list[min_child] = tmp
      end
      i = min_child
    end
  end

  def min_child(i)
    if i * 2 + 1 > self.current_size
      return i * 2
    else
      if self.heap_list[i * 2] < self.heap_list[i * 2 + 1]
        return i * 2
      else
        return i * 2 + 1
      end
    end
  end

  def del_min
    return_value = self.heap_list[1]
    self.heap_list[1] = self.heap_list[self.current_size]
    self.current_size = self.current_size - 1
    self.heap_list.pop
    self.perc_down(1)
    return return_value
  end

  def build_heap(list)
    i = list.length / 2
    self.current_size = list.length
    self.heap_list = [0] + list
    while (i > 0) do
      self.perc_down(i)
      i = i - 1
    end
  end
end

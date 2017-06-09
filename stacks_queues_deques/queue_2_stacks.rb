# Implement a Queue using two Stacks

class Queue2Stacks

  def initialize
    @stack1 = []
    @stack2 = []
  end

  def enqueue(element)
    @stack1.push(element)
  end

  def dequeue
    i = 0
    length = @stack1.length
    while i < length do
      @stack2.push(@stack1.pop)
      i += 1
    end
    @stack2.pop
  end

end

class BinaryTree
  attr_accessor :key, :left_child, :right_child

  def initialize(root_obj)
    @key = root_obj
    @left_child = nil
    @right_child = nil
  end

  def insert_left(new_node)

    if self.left_child == nil
      self.left_child = BinaryTree.new(new_node)
    else
      t = BinaryTree.new(new_node)
      t.left_child = self.left_child
      self.left_child = t
    end
  end

  def insert_right(new_node)

    if self.right_child == nil
      self.right_child = BinaryTree.new(new_node)
    else
      t = BinaryTree.new(new_node)
      t.right_child = self.right_child
      self.right_child = t
    end
  end
end

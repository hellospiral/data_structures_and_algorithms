class BinaryTree
  attr_accessor :key, :left_child, :right_child

  def initialize(root_obj)
    @key = root_obj
    @left_child = nil
    @right_child = nil
  end

  def insert_left(key)
    node = BinaryTree.new(key)
    if @left_child
      node.left_child = @left_child
    end
    @left_child = node
  end

  def insert_right(key)
    node = BinaryTree.new(key)
    if @right_child
      node.right_child = @right_child
    end
    @right_child = node
  end
end

def preorder(tree)
  if tree
    puts tree.key
    preorder(tree.left_child)
    preorder(tree.right_child)
  end
end

def postorder(tree)
  if tree
    postorder(tree.left_child)
    postorder(tree.right_child)
    puts tree.key
  end
end

def inorder(tree)
  if tree
    inorder(tree.left_child)
    puts tree.key
    inorder(tree.right_child)
  end
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = nil
    @right = nil
  end
end

class BST
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(data)
    new_node = Node.new(data)
    if @root == nil
      @root = new_node
    else
      current = @root
      parent = nil
      while true do
        parent = current
        if data < current.data
          current = current.left
          if current == nil
            parent.left = new_node
            break
          end
        else
          current = current.right
          if current == nil
            parent.right = new_node
            break
          end
        end
      end
    end
  end

  def in_order(node)
    if node != nil
      in_order(node.left)
      puts node.data
      in_order(node.right)
    end
  end

  def pre_order(node)
    if node != nil
      puts node.data
      pre_order(node.left)
      pre_order(node.right)
    end
  end

  def post_order(node)
    if node != nil
      post_order(node.left)
      post_order(node.right)
      puts node.data
    end
  end

  def get_min(node)
    current = node
    while current.left != nil
      current = current.left
    end
    current.data
  end

  def get_max(node)
    current = node
    while current.right != nil
      current = current.right
    end
    current.data
  end

  def find(data)
    current = @root
    while current && current.data != data do
      if data < current.data
        current = current.left
      else
        current = current.right
      end
    end
    return current
  end

  def remove(data)
    root = remove_node(@root, data)
  end

  def remove_node(node, data)
    if node == nil
      return nil
    end

    if data == node.data
      # node has no children
      if node.left == nil && node.right == nil
        return nil
      end
      # node has no left child
      if node.left == nil
        return node.right
      end
      # node has no right child
      if node.right == nil
        return node.left
      end
      # node has two children
      temp_node = get_min(node.right)
      node.data = temp_node.data
      node.right = remove_node(node.right, temp_node.data)
      return node
    elsif data < node.data
      node.left = remove_node(node.left, data)
      return node
    else
      node.right = remove_node(node.right, data)
      return node
    end
  end
end

t = BST.new
t.insert(23)
t.insert(45)
t.insert(16)
t.insert(37)
t.insert(3)
t.insert(99)
t.insert(22)

t.in_order(t.root)
t.remove(37)
t.in_order(t.root)

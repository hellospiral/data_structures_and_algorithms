class TreeNode
  attr_accessor :key, :payload, :left_child, :right_child, :parent

  def initialize(key, val, left = nil, right = nil, parent = nil)
    @key = key
    @payload = val
    @left_child = left
    @right_child = right
    @parent = parent
  end

  def is_left_child?
    return @parent && @parent.left_child == self
  end

  def is_right_child?
    return @parent && @parent.right_child == self
  end

  def is_root?
    return !@parent
  end

  def is_leaf?
    return !(@right_child || @left_child)
  end

  def has_any_children?
    return @right_child || @left_child
  end

  def has_both_children?
    return @right_child && @left_child
  end

  def replace_node_data(key, value, lc, rc)
    @key = key
    @payload = value
    @left_child = lc
    @right_child = rc
    if @left_child
      @parent = self
    end
    if @right_child
      @right_child.parent = self
    end
  end
end


class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @size = 0
  end

  def length
    return @size
  end

  def __iter__
    return @root.__iter__
  end

  def put(key, val)
    if @root
      self._put(key, val, @root)
    else
      @root = TreeNode.new(key, val)
    end
    @size = @size += 1
  end

  def _put(key, val, current_node)
    if key < current_node.key
      if current_node.left_child
        self._put(key, val, current_node.left_child)
      else
        new_tree = TreeNode.new(key, val)
        current_node.left_child = new_tree
        new_tree.parent = current_node
      end
    else
      if current_node.right_child
        self._put(key, val, current_node.right_child)
      else
        new_tree = TreeNode.new(key, val)
        current_node.right_child = new_tree
        new_tree.parent = current_node
      end
    end
  end

  def __set_item__(key, value)
    self.put(key, value)
  end

  def get(key)
    if @root
      response = self._get(key, @root)
      if response
        return response.payload
      else
        return nil
      end
    else
      return nil
    end
  end

  def _get(key, current_node)
    if !current_node
      return nil
    elsif current_node.key == key
      return current_node
    elsif key < current_node.key
      return self._get(key, current_node.left_child)
    else
      return self._get(key, current_node.right_child)
    end
  end

  def __get_item__(key)
    return self.get(key)
  end

  def __contains__(key)
    if self._get(key, @root)
      return true
    else
      return false
    end
  end
end

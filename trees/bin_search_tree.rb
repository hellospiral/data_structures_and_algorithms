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

  def find_successor
    succ = nil
    if @right_child
      succ = @right_child.find_min
    else
      if @parent
        if self.is_left_child?
          succ = @parent
        else
          @parent.right_child = nil
          succ = @parent.find_successor
          @parent.right_child = self
        end
      end
    end
  end

  def find_min
    current = self
    while current.left_child
      current = current.left_child
    end
    return current
  end

  # def __iter__
  #   if self
  #     if @left_child
  #       @left_child.each do |elem|
  #         puts elem.key
  #       end
  #     end
  #     puts @key
  #     if @right_child
  #       @right_child.each do |elem|
  #         puts elem.key
  #       end
  #     end
  #   end
  # end
end


class BinarySearchTree
  attr_reader :root, :size

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

  def delete(key)
    if @size > 1
      node_to_remove = self._get(key, @root)
      if node_to_remove
        self.remove(node_to_remove)
        @size -= 1
      else
        raise 'Error, key not in tree'
      end
    elsif @size == 1 && @root.key == key
      @root = nil
      @size -= 1
    else
      raise 'Error, key not in tree'
    end
  end

  def remove(current_node)
    # node has no children
    if current_node.is_leaf?
      if current_node == current_node.parent.left_child
        current_node.parent.left_child = nil
      else
        current_node.parent.right_child = nil
      end
    # node has both children
    elsif current_node.has_both_children?
      succ = current_node.find_successor
      succ.splice_out
      current_node.key = succ.key
      current_node.payload = succ.payload
    # node has one child
    else
      if current_node.left_child
        if current_node.is_left_child?
          current_node.left_child.parent = current_node.parent
          current_node.parent.left_child = current_node.left_child
        elsif current_node.is_right_child?
          current_node.left_child.parent = current_node.parent
          current_node.parent.right_child = current_node.left_child
        else
          current_node.replace_node_data(current_node.left_child.key,
            current_node.left_child.payload,
            currentNode.left_child.left_child,
            currentNode.left_child.right_child
          )
        end
      else # node has right_child
        if current_node.is_left_child?
          current_node.right_child.parent = current_node.parent
          current_node.parent.left_child = current_node.right_child
        elsif current_node.is_right_child?
          current_node.right_child.parent = current_node.parent
          current_node.parent.right_child = current_node.right_child
        else
          current_node.replace_node_data(current_node.right_child.key,
            current_node.right_child.payload,
            currentNode.right_child.left_child,
            currentNode.right_child.right_child
          )
        end
      end
    end
  end
end

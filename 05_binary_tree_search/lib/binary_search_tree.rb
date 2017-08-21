# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require "bst_node"

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil 
  end

  def insert(value)
    if @root.nil? 
      @root = BSTNode.new(value)
    else 
      insert!(value, @root)
    end
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value < tree_node.value
      return find(value, tree_node.left) if tree_node.left
    elsif value > tree_node.value
      return find(value, tree_node.right) if tree_node.right
    end
    nil
  end

  def delete(value)
    @root = delete!(value, root)
  end

  def maximum(tree_node = @root)
    max = tree_node
    max = max.right until max.right.nil?
    max
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    if depth(tree_node.left) > depth(tree_node.right)
      bigger = depth(tree_node.left) + 1
    else
      bigger = depth(tree_node.right) + 1
    end
    bigger
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1
    is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    arr = in_order_traversal(tree_node.left, arr) if tree_node.left
    arr << tree_node.value 
    arr = in_order_traversal(tree_node.right, arr) if tree_node.right
    arr
  end


  private
  # optional helper methods go here:
  def insert!(value, parent)
    if value <= parent.value && parent.left 
      insert!(value, parent.left)
    elsif value <= parent.value 
      parent.left = BSTNode.new(value)
      parent.left.parent = parent
    elsif value > parent.value && parent.right 
      insert!(value, parent.right)
    else
      parent.right = BSTNode.new(value) 
      parent.right.parent = parent 
    end 
  end

  def delete!(value, parent)
    if value == parent.value && parent.left.nil? && parent.right.nil?
      nil
    elsif value == parent.value && parent.left && parent.right
      pivot = maximum(parent.left)
      pivot.parent.right = pivot.left
      pivot
    elsif value == parent.value && parent.left
      parent.left
    elsif value == parent.value && parent.right
      parent.right
    elsif value < parent.value
      parent.left = delete!(value, parent.left) unless parent.left.nil?
    elsif value > parent.value
      parent.right = delete!(value, parent.right) unless parent.right.nil?
    end
  end
end


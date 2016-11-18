class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    @parent.children.delete_if { |el| el.value == value } if @parent
    parent_node.children << self unless parent_node.nil?
    @parent = parent_node
  end

  def add_child(child_node)
    child_node.parent = self unless child_node.parent == self
  end

  def remove_child(child_node)
    raise "Node is not a child!" unless children.include?(child_node)
    child_node.parent = nil
  end


  def dfs(target_value)
    return self if value == target_value
    children.each do |child|
      cur_node = child.dfs(target_value)
      return cur_node if cur_node
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target_value
      el.children.each { |child| queue << child }
    end
    nil
  end
end

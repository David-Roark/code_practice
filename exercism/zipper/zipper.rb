class Node
  attr_accessor :value, :left, :right, :up

  def initialize(value, left = nil, right =nil , up = nil)
    @value = value
    @up = up
    @left = left
    @right = right
  end

  def ==(oth)
    @value == oth.value &&
    @left == oth.left &&
    @right == oth.right
  end
end

class Zipper
  attr_reader :tree

  def initialize(tree, focus = nil)
    @tree = tree
    @focus = focus || tree
  end

  def self.from_tree(tree)
    new(tree)
  end

  def to_tree
    @tree
  end

  def left
    return nil unless @focus.left
    f = @focus
    @focus = f.left
    @focus.up = f
    self
  end

  def right
    return nil unless @focus.right
    f = @focus
    @focus = f.right
    @focus.up = f
    self
  end

  def up
    return nil unless @focus.up
    @focus = @focus.up
    self
  end

  def value
    @focus.value
  end

  def set_value(v)
    @focus.value = v
    self
  end

  def set_left(v)
    @focus.left = v
    self
  end

  def set_right(v)
    @focus.right = v
    self
  end

  def ==(oth)
    @tree == oth.tree
  end
end

# ANOTHER WAY

# def Node.build_up
#   node = self
#
#   while node.left || node.right
#     if node.left
#       up = node
#       node.left.up = up
#       node = node.left
#     end
#
#     if node.right
#       up = node
#       node.right.up = up
#       node = node.right
#     end
#   end
#
#   self
# end
#
# class Zipper
#   attr_reader :root
#
#   def initialize(root, up, left, right, now)
#     @root = root
#     @node_up = up
#     @node_left = left
#     @node_right = right
#     @node_now = now
#   end
#
#   def self.from_tree(tree)
#     tree.build_up
#
#     root = tree
#     u = tree.up
#     l = tree.left
#     r = tree.right
#     n = tree
#
#     new(root, u, l, r, n)
#   end
#
#   def to_tree
#     @root
#   end
#
#   def left
#     return nil unless @node_left
#     u = @node_now
#     l = @node_left.left
#     r = @node_left.right
#     n = @node_left
#     Zipper.new(@root, u, l, r, n)
#   end
#
#   def right
#     return nil unless @node_right
#     u = @node_now
#     l = @node_right.left
#     r = @node_right.right
#     n = @node_right
#     Zipper.new(@root, u, l, r, n)
#   end
#
#   def up
#     return nil unless @node_up
#     u = @node_up.up
#     l = @node_up.left
#     r = @node_up.right
#     n = @node_up
#     Zipper.new(@root, u, l, r, n)
#   end
#
#   def value
#     @node_now.value
#   end
#
#   def set_value(v)
#     @node_now.value = v
#     self
#   end
#
#   def set_left(node_left)
#     @node_now.left = node_left&.build_up
#     self
#   end
#
#   def set_right(node_right)
#     @node_now.right = node_right&.build_up
#     self
#   end
#
#   def ==(oth)
#     @root == oth.root
#   end
#
# end

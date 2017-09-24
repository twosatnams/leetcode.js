require 'byebug'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def serialize(data)
  Hash.new { |hash, key| hash[key] =  }
  queue = [root]
  result = []

  while !queue.empty?
    level = queue
    queue = []
    result.concat(level)
    next_level = []

    level.each do |node|
      if node.nil?
        next_level.push(nil, nil)
        next
      end
      node.left.nil? ? next_level.push(nil) : next_level.push(node.left)
      node.right.nil? ? next_level.push(nil) : next_level.push(node.right)
    end

    if next_level.all? { |element| element.nil? }
      queue = []
    else
      queue = next_level
    end
  end

  return result.map { |e| e.nil? ? "null" : e.val }
end

def deserialize(data)
  nodes = data.map { |el| el == "null" ? nil : TreeNode.new(el) }
  kids = nodes.reverse
  root = kids.pop
  nodes.each do |node|
    next if node.nil?
    node.left = kids.pop unless kids.empty?
    node.right = kids.pop unless kids.empty?
  end

  return root
end

a = TreeNode.new(1)
b = TreeNode.new(2)
c = TreeNode.new(3)
d = TreeNode.new(4)
e = TreeNode.new(5)

a.left = b
a.right = c
b.left = d
c.right = e
result = serialize(a)
result = deserialize(result)
debugger
puts result

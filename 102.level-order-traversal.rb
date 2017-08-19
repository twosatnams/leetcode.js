def level_order_traversal(node)
  result = []
  return result if root.nil?

  queue = []
  queue.push(root)
  while !queue.empty?
    current_level = queue.map { |node| node.val }
    result.push(current_level)
    next_level = []
    queue.each do |level_node|
      next_level.push(level_node.left) if !level_node.left.nil?
      next_level.push(level_node.right) if !level_node.right.nil?
    end
    queue = next_level
  end
  return result
end

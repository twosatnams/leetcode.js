def merge_k_lists(lists)
  queue = PriorityQueue.new
  result = []

  # put a pointer to each list in the queue
  lists.each do |list|
    queue.add(list, list.val) unless list.nil?
  end
  while !queue.empty?
    next_element = queue.remove # O(log(N))
    result.push(next_element.value.val)
    queue.add(next_element.value.next, next_element.value.next.val) unless next_element.value.next.nil?# O(log(N))
  end

  return result
end

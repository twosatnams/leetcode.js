class Node
  attr_accessor :value, :priority
  def initialize(value, priority)
    @value = value
    @priority = priority
  end
end

class PriorityQueue

  attr_accessor :store

  def initialize
    # the minimum value is always the root node
    @store = []
  end

  def add(element, priority)
    # Add to the bottom and them climb it higher
    node = Node.new(element, priority)
    @store.push(node)
    idx = @store.length - 1

    # if the parent is bigger than the element, then swap.
    # Keep swapping until the parent is equal or smaller
    while idx >= 1 && @store[get_parent_idx(idx)].priority > @store[idx].priority
      parent_idx = get_parent_idx(idx)
      parent_node = @store[get_parent_idx(idx)]
      @store[idx] = parent_node
      @store[parent_idx] = node
      idx = parent_idx
    end
  end

  def remove
    result = @store.first
    last_element = @store.last
    @store[0] = last_element
    @store.pop
    idx = 0

    # Keep demoting the last_element until both children are higher in priority

    while !get_lower_child_idx(idx).nil? && @store[get_lower_child_idx(idx)].priority < @store[idx].priority
      lower_idx = get_lower_child_idx(idx)
      lower_child = @store[lower_idx]
      @store[lower_idx] = @store[idx]
      @store[idx] = lower_child
      idx = lower_idx
    end

    return result
  end

  def peek
    # O(1)
    return @store.first
  end

  def get_parent_idx(idx)
    if idx % 2 == 0
      return (idx - 2)/2
    else
      return (idx - 1)/2
    end
  end

  def get_children_idx(idx)
    # Children are always at 2n+1 and 2n+2
    result = []
    result.push(2*idx + 1) if 2*idx + 1 <= @store.length - 1
    result.push(2*idx + 2) if 2*idx + 2 <= @store.length - 1
    return result
  end

  def get_lower_child_idx(idx)
    children = get_children_idx(idx)

    if children.length == 0
      return nil
    elsif children.length == 1
      return children.first
    elsif @store[children.first].priority >= @store[children.last].priority
      return children.last
    else
      return children.first
    end
  end

  def empty?
    @store.empty?
  end

  def print_all
    result = ""
    @store.each do |node|
       result += " #{node.value} "
    end
    return result
  end

  def length
     @store.length
  end
end

queue = PriorityQueue.new
queue.add("a", 1)
queue.add("c", 3)
queue.add("d", 4)
queue.add("e", 5)
queue.add("f", 6)
queue.add("b", 2)
queue.add("b", 2)
queue.add("g", 7)

a = queue.remove
puts a.value
b = queue.remove
puts b.value
c = queue.remove
puts c.value
d = queue.remove
puts d.value
e = queue.remove
puts e.value
f = queue.remove
puts f.value
g = queue.remove
puts g.value

class MaxHeap

  # Properties of heap
  # 1. The parent is always greater than the child. No such relation with siblings.
  # 2. The children of node at idx n are at 2n + 1 and 2n + 2.
  attr_reader :store
  def initialize
    @store = []
  end

  def get_max
    return @store.first
  end

  def insert(val)
    # We start from the bottom and see where we can fit this element
    @store.push(val)
    current_idx = @store.length - 1
    parent_idx = get_parent_idx(current_idx)

    while @store[parent_idx] < val
      temp = @store[parent_idx]
      @store[parent_idx] = val
      @store[current_idx] = temp
      current_idx = parent_idx
      parent_idx = get_parent_idx(current_idx)
    end
  end

  def extract_max
    # take the last element and make it the root
    return @store.first if store.length == 1
    last_element = @store.pop
    result = @store.shift
    @store.unshift(last_element)
    last_element_idx = 0

    # now balance the tree
    greater_child_idx = get_greater_child_idx(last_element_idx)
    while !greater_child_idx.nil? && @store[greater_child_idx] > @store[last_element_idx]
      @store[last_element_idx], @store[greater_child_idx] = @store[greater_child_idx], @store[last_element_idx]
      last_element_idx = greater_child_idx
      greater_child_idx = get_greater_child_idx(last_element_idx)
    end
    return result
  end

  def get_parent_idx(idx)
    return nil if idx <= 0
    if idx % 2 == 0
      parent = (idx - 2)/2
    else
      parent = (idx - 1)/2
    end
    parent
  end

  def get_children_idx(idx)
    result = []
    result.push(2*idx + 1) if 2*idx + 1 <= @store.length - 1
    result.push(2*idx + 2) if 2*idx + 2 <= @store.length - 2
    return result
  end

  def get_greater_child_idx(idx)
    children = get_children_idx(idx)
    return nil if children.empty?
    if @store[children.first] >= @store[children.last]
      greater_child_idx = children.first
    else
      greater_child_idx = children.last
    end
    return greater_child_idx
  end
end

# Question
Find the sum of all left leaves in a given binary tree.
Example:

    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

------------------------------------------------------------------------------

If we had links to the parents, this was easy. BFS, check if leaf and check if left child. DONE

But since we do not, checking if its the left child is the challenge.
So we gotta be one step ahead in BFS. Like this.

1. Before pushing to the queue. Do the following checks.
2. Check if the element is leaf and if its the left child.
3. If so, add to a variable. Do not add to the queue.

------------------------------------------------------------------------------

```
def sum_left_leaves(root)
  sum = 0
  queue = []
  queue.push(root) if !root.nil?
  while !queue.empty?
    node = queue.shift
    queue.push(node.right) if node.right != nil

    if node.left != nil
      # check if leaf
      if node.left.left == nil and node.left.right == nil
        sum += node.left.val
      else
        queue.push(node.left)
      end
    end
  end

  return sum
end
```

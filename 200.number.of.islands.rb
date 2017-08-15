# https://leetcode.com/problems/number-of-islands/description/

# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands.
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
# You may assume all four edges of the grid are all surrounded by water.

# Example 1:
# 11110
# 11010
# 11000
# 00000
# Answer: 1
#
# Example 2:
# 11000
# 11000
# 00100
# 00011
# Answer: 3

# Solution 1
# General idea is to traverse the matrix and look for islands.

# 1. Iterate from left to right. Keep track of islands as sets.
# 2. Sets should have the possible next coordinates.
# 3. Whenever we encounter a one. O(size of matrix).
# 3.1. Check how many islands it exists in. O(number of ones in a row)
# 3.2. If it exists in two or more islands, join them. 0(number of islands) - worst case
# 3.3 If it exists in one island, extend it.
# 3.4 If it does not connect with anyone, start a new island.
# 4. Return number of sets.

# Solution 2
# General idea is to find graphs as soon as we see a one and then keep a set of visited nodes.
# 1. Iterate the matrix. O(size of the matrix). Keep a set for visited.
# 2. As soon as we see a one. We look for a graph. O(size of average graph).

# I like second better because its simpler. And also it a better worst case scenario.

require 'set'
require 'byebug'

def exists_on_graph(block, graph)
  x, y = block[0], block[1]
  if x < 0 or y < 0
    return false
  elsif x >= graph.length or y >= graph[0].length
    return false
  end
  return true
end

def number_of_islands(graph)
  result = 0
  visited = Set.new

  x = 0
  while x < graph.length
    y = 0
    while y < graph[0].length
      # puts "Reading #{x}, #{y} : #{graph[x][y]}"
      if visited.include?([x, y])
        y += 1
        next
      end
      if graph[x][y].to_i == 1
        # puts "Found a new graph. Looking further..."
        possible_blocks = []
        possible_blocks.push([x - 1, y])
        possible_blocks.push([x, y - 1], [x, y + 1])
        possible_blocks.push([x + 1, y])
        until possible_blocks.empty?
          block = possible_blocks.shift
          p, q = block[0], block[1]
          next unless exists_on_graph(block, graph)
          next if graph[p][q].to_i != 1
          next if visited.include?(block)
          # puts "Visiting: #{block[0]}, #{block[1]}"
          # puts "Visisted size: #{visited.length}"
          visited.add(block)
          possible_blocks.push([p - 1, q])
          possible_blocks.push([p, q - 1], [p, q + 1])
          possible_blocks.push([p + 1, q])
        end
        result += 1
        visited.add([x, y])
      end
      y += 1
    end
    x += 1
  end
  return result
end

puts number_of_islands(["11110","11010","11000","00000"]) == 1
puts number_of_islands(["11000","11000","00100","00011"]) == 3

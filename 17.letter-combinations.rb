# Given a digit string, return all possible letter combinations that the number could represent.
# A mapping of digit to letters (just like on the telephone buttons) is given below.
#
# Example
# Input:Digit string "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

def letter_combinations(digits)
  mapping = {
    '1' => [],
    '2' => ['a', 'b', 'c'],
    '3' => ['d', 'e', 'f'],
    '4' => ['g', 'h', 'i'],
    '5' => ['j', 'k', 'l'],
    '6' => ['m', 'n', 'o'],
    '7' => ['p', 'q', 'r', 's'],
    '8' => ['t', 'u', 'v'],
    '9' => ['w', 'x', 'y', 'z'],
  }
  return [] if digits.length <= 0

  digits = digits.split("")
  result = ['']
  digits.each do |num|
    letters = mapping[num]
    new_paths = []
    letters.each do |letter|
      result.each do |path|
        new_paths.push(path + letter)
      end
    end
    result = new_paths
  end

  return result
end

puts letter_combinations("234")

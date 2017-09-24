# Question - Given two strings S and T, determine if they are both one edit distance apart.

# Solution (Geeks for Geeks)
# Let the input strings be s1 and s2 and lengths of input
# strings be m and n respectively.

# 1) If difference between m an n is more than 1,
#      return false.
# 2) Initialize count of edits as 0.
# 3) Start traversing both strings from first character.
#     a) If current characters don't match, then
#        (i)   Increment count of edits
#        (ii)  If count becomes more than 1, return false
#        (iii) If length of one string is more, then only
#              possible  edit is to remove a character.
#              Therefore, move ahead in larger string.
#        (iv)  If length is same, then only possible edit
#              is to  change a character. Therefore, move
#              ahead in both strings.
#     b) Else, move ahead in both strings.

def is_one_edit_distance?(first, second)
  difference = (first.length - second.length).abs
  if difference > 1
    return false
  else
    num_edits = 0
    if first.length > second.length
      smaller, larger = second, first
    elsif first.length < second.length
      smaller, larger = first, second
    else
      smaller, larger = first, second
    end

    l_idx = 0
    s_idx = 0
    while l_idx < larger.length
      if larger[l_idx] != smaller[s_idx]
        num_edits += 1
        return false if num_edits > 1

        if difference == 1
          l_idx += 1
        else
          l_idx += 1
          s_idx += 1
        end
      else
        l_idx += 1
        s_idx += 1
      end
    end

    if num_edits == 1
      return true
    else
      return false
    end
  end
end

puts is_one_edit_distance?('batakr', 'batak')

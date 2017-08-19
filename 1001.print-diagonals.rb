require 'byebug'

def matrix_madness(matrix)
  result = []
  matrix_idxes = get_matrix(matrix.length - 1)
  matrix_idxes.each { |dia| p dia }
  matrix_idxes.each do |diagonal|
    diag = diagonal.map { |coord| matrix[coord.first][coord.last] }
    result.push(diag)
  end
  return result
end

def get_matrix(n)
  result = []
  (0..n).each do |row|
    diagonal = get_diagonal(row, 0)
    result.push(diagonal)
  end

  (1..n).each do |row|
    diagonal = get_diagonal(n, row)
    result.push(diagonal)
  end
  return result
end

def get_diagonal(m, n)
  result = []
  original_n = n
  while m > original_n
    result.push([m,n])
    m -= 1
    n += 1
  end
  result.push([m, n])
  return result
end



p matrix_madness([[1, 2, 3, 4],[5, 6, 7, 8],[9, 10, 11, 12],[13, 14, 15, 16]])

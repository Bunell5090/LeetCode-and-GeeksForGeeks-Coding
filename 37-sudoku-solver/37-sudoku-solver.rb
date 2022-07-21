# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  return if board.nil? || board.empty?
  solve(board)
end

def solve(board)
  (0...board.length).each do |row|
    (0...board[row].length).each do |col|
      next unless board[row][col] == '.'
      
      '1'.upto('9').each do |char|
        next unless is_valid?(board, row, col, char)
        
        board[row][col] = char
        
        return true if solve(board)
        
        board[row][col] = '.'
      end
      
      return false
    end
  end
  
  return true
end

def is_valid?(board, row, col, char)
  (0...9).each do |i|
    return false if board[row][i] != '.' && board[row][i] == char # check row
    return false if board[i][col] != '.' && board[i][col] == char # check col
    return false if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != '.' && board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == char # check 3 * 3 block
  end
end
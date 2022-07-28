# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
    return 0 if matrix.empty?
    
    m = matrix.length
    n = matrix.first.length
    
    heights = Array.new(m).map{Array.new(n)}
    left_boundaries = Array.new(m).map{Array.new(n)}
    consecutive_left_boundaries = Array.new(m).map{Array.new(n)}
    right_boundaries = Array.new(m).map{Array.new(n)}
    consecutive_right_boundaries = Array.new(m).map{Array.new(n)}
    
    # update heights
    0.upto(m-1) do |r|
        0.upto(n-1) do |c|
            if matrix[r][c] == '0'
                heights[r][c] = 0
            else
                if r - 1 >= 0
                    heights[r][c] = heights[r-1][c] + 1
                else
                    heights[r][c] = 1
                end
            end
        end
    end
    
    # update left_boundaries
    0.upto(m-1) do |r|
        0.upto(n-1) do |c|
            if c - 1 >= 0 && matrix[r][c-1] == '1'
                current_left_boundary = consecutive_left_boundaries[r][c-1]
            else
                current_left_boundary = c
            end
            consecutive_left_boundaries[r][c] = current_left_boundary
            if r - 1 >= 0 && matrix[r-1][c] == '1'
                left_boundaries[r][c] = [current_left_boundary, left_boundaries[r-1][c]].max
            else
                left_boundaries[r][c] = current_left_boundary
            end
        end
    end
    
    # update right boundaries
    0.upto(m-1) do |r|
        (n-1).downto(0) do |c|
            if c + 1 <= n - 1 && matrix[r][c+1] == '1'
                current_right_boundary = consecutive_right_boundaries[r][c+1]
            else
                current_right_boundary = c
            end
            consecutive_right_boundaries[r][c] = current_right_boundary
            if r - 1 >= 0 && matrix[r-1][c] == '1'
                right_boundaries[r][c] = [current_right_boundary, right_boundaries[r-1][c]].min
            else
                right_boundaries[r][c] = current_right_boundary
            end
        end
    end
    
    max_rect = 0
    0.upto(m-1) do |r|
        0.upto(n-1) do |c|
            rect = heights[r][c] * (right_boundaries[r][c] - left_boundaries[r][c] + 1)
            max_rect = rect if rect > max_rect
        end
    end
    max_rect
end
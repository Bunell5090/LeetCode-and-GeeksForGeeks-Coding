def is_match_char(sc, pc)
    pc == '*' || pc == '?' || sc == pc
end

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    dp = Array.new(s.length + 1).map{Array.new(p.length + 1)}
    0.upto(s.length) do |i|
        0.upto(p.length) do |j|
            if i == 0 && j == 0
                dp[0][0] = true
            elsif i == 0
                dp[i][j] = p[0..(j-1)] == '*' * j
            elsif j == 0
                dp[i][j] = false
            else
                dp[i][j] = (dp[i-1][j-1] && is_match_char(s[i-1], p[j-1])) ||
                           (dp[i-1][j] && p[j-1] == '*') ||
                           (dp[i][j-1] && p[j-1] == '*')
            end
        end
    end
    dp[s.length][p.length]
end
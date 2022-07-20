# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = []
  gen(res, '', n, 0, 0)
  
  res
end

def gen(res, str, n, open_num, close_num)
  res << str if close_num == n
  
  gen(res, "#{str})", n, open_num, close_num + 1) if close_num < open_num
  gen(res, "#{str}(", n, open_num + 1, close_num) if open_num < n
end
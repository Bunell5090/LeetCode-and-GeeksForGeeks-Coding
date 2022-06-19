# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
i = digits.length-1
  digits.join.succ.chars.map(&:to_i)
end
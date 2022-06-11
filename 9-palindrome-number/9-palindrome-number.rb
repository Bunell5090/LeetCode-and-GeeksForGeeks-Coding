# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
    if x.to_s == x.to_s.reverse
        return true
    else 
       return false
    end
end
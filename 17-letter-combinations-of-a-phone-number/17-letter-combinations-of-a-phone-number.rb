# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    dialpad = [[],[],["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n",'o'],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
    return [] if digits.length==0
    ret_strings = []
    for letter in 0...dialpad[digits[0].to_i].length
        ret_strings<<dialpad[digits[0].to_i][letter]
    end
    
    for i in 1...digits.length
        new_strings = []
        ret_strings.each do |str|
            for letter in 0...dialpad[digits[i].to_i].length
                new_strings<<str + dialpad[digits[i].to_i][letter]
            end
        end
        ret_strings = new_strings
    end
    
    return ret_strings
end
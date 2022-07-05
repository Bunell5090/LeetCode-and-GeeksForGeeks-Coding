# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    mp = p = i = 0
    while i < prices.length()-1 
        p = [0, p+= prices[i+1]-prices[i]].max
        mp = [mp, p].max
        i+=1
    end
    mp
end
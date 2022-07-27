# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
	
    return 1 if nums.size == 0  #---return 1 if array empty
    nums_sorted = nums.sort.reverse
    
    return 1 if (nums_sorted[0] < 0) #---return 1 if all elements in array are negative
    
	#---remove -ve elements from +ve ones
    while(nums_sorted[-1] < 0)
        nums_sorted.pop
    end
    return 1 if (nums_sorted[-1] > 1) #---return 1 if all elements +ve but greater than 1
    total = nums_sorted.size
    (total-1).downto(1) do |i| 
        difference = nums_sorted[i] - nums_sorted[i-1]
		#---if difference between numbers is >1, answer is in middle of both numbers
        if (difference.abs > 1 )
            return nums_sorted[i]+1 
        end
    end
    return nums_sorted[0]+1 	#---ifno number is skipped, return next big integer
end
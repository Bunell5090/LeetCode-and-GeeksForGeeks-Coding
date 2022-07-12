# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    combined = nums1.concat(nums2)
    combined = combined.sort
    var4 = 0
    if combined.length.odd?
        var1 = ((combined.length).div(2))
        result = combined[var1]
    end
    if combined.length.even?
        var2 = ((combined.length).div(2))
        var3 = (var2) - 1
        var4 = (combined[var2]) + (combined[var3])
		        result = var4/(2.to_f)
    end
    result 
end
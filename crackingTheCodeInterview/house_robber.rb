def rob(nums)
    return 0 if nums.nil? || nums.length == 0
    
    maxAt = []
    maxAt.push({ robbed: nums.first, not_robbed: 0 })
    
    nums.each_with_index do |num, idx|
        next if idx == 0
        maxAt.push({
            robbed: maxAt[idx - 1][:not_robbed] + num,
            not_robbed: [maxAt[idx - 1][:robbed], maxAt[idx - 1][:not_robbed]].max
        })
    end
    
    return [maxAt[-1][:robbed], maxAt[-1][:not_robbed]].max
end

p rob([2,1,1,2]) == 4
p rob([]) == 0 
p rob([1,2,3,4,5,6]) == 12
p rob([3,7,7,4,1]) == 11
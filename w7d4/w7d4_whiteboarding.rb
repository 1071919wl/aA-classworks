# Problem 1:
# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
# Note: Given n will be a positive integer.
#
# Example 1:
# Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps
#
# Example 2:
# Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step
#
# Example 3:
# Input: 4
# Output: 5
# Explanation: 
# 1. 1 step + 1 step + 1 step + 1 step
# 2. 1 step + 2 steps +  1 step
# 3. 2 step + 1 steps + 1 step
# 4. 1 step + 1 steps + 2 step
# 5. 2 steps + 2 steps

# Example 3:
# Input: 10
# Output: 
# Explanation: 
# 1. 1 + 1  + 1 + 1  + 1 + 1 + 1 + 1 + 1 + 1
# 2. 1  + 2 +  1 + 1 + 1 + 1 + 1 + 1 
# 3. 2  + 1 + 1 
# 4. 1  + 1 + 2 
# 5. 2 + 2
def example1(n)
    arr = [0, 1 ,2, 3, 5]
    i = 3 
    while(i <= n)
        arr[i] = arr[i - 1] + arr[i - 2]
        i += 1
    end

    arr[n]

end

p example1(2)
p example1(3)
p example1(4)

# Problem 2:
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Note:
# Minimize the total number of operations.

def example2(arr)
    results = []
    # arr.reverse.each do |ele|
    #     ele == 0 ? results << ele : results.unshift(ele)
    # end

    arr.each_with_index do |el, idx|
        if el == 0
            results << el
            arr.delete_at(idx)
        end
    end
    arr.concat(results)
end
p example2([0,1,0,3,12])

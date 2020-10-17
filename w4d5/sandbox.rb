def my_min(arr)
    min = 1 / 0.0
    arr.each do |ele|
        min = ele if ele < min
    end
    min
    # arr.each_with_index do |ele, idx|
    #     new_arr = arr[0...idx] + arr[idx+1..-1]
    #     holder = []
    #     new_arr.each do |ele2|
    #         if ele2 < ele
    #             holder << true 
    #         end
    #     end
    #     return ele if holder.empty?
    # end
end
#Phase1 O(n ** 2)
#Phase2 O(n)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(arr)
    # sub_arr = []
    # (0...arr.length).each do |idx|
    #     (idx...arr.length).each do |idx_2| 
    #         sub_arr << arr[idx..idx_2]
    #     end
    # end
    # p sub_arr.length 
    # sub_arr.map {|sub| sub.sum }.max
    max = arr.first #8
    curr = arr.first #8
    arr.drop(1).each do |ele| 
        curr = 0 if curr < 0
        curr += ele
        max = curr if curr > max
    end
    max
end

# phase_1 O(n**2 )


list = [5, 3, -7] # n = 3, n! = 6
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7] # n = 6, 
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


def bad_two_sum?(arr, target)
    arr.each_with_index do |e1, i1|
        arr.each_with_index do |e2, i2|
            if i2 > i1
                return true if e1 + e2 == target
            end
        end
        
    end
    false
end
#O(n ** 2)

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
    arr = arr.sort #n log n
    i, j = 0, arr.length - 1 #2

    while j > i  #n
        curr_sum = arr[i] + arr[j]
        if curr_sum > target
            j -= 1
        elsif curr_sum < target
            i += 1
        else
            return true
        end
    end
    false
end
# O(n log n)
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
    hash = {}
    arr.each_with_index do |ele, i| #n
        hash[i] = ele
    end
    arr.each_with_index do |ele, i| #n 
        value = target - ele
        if hash.has_value?(value) && hash.key(value) != i
            return true
        end
        # all the keys in has except i
        # if any of the value = value
    end
    false
end


p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
# arr.each do |ele|
    # return true if hash [targe - ele]
    # hash[ele] = true
# end
#[1, 1, 5, 7] ==>2

hash = {
    0 => 1,
    1 => 1,
    2 => 5,
    3 => 7
}
# target - ele = result
# # create a new hash
# # arr.each 
# # a
# [pre_ele] = [targe - curr_ele]



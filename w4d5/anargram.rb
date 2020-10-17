def first_anagram?(str1, str2)
    arr = anagrams(str1)
    p arr.length
    arr.include?(str2)
    
end

def anagrams(str) #gizmo
    return [str] if str.length <= 1
    short_a = anagrams(str[0...-1]) #["ig", "gi"] giz
    res = []
    short_a.each do |anagram|
        (0..anagram.length).each do |i|
            res << anagram.dup.insert(i, str[-1])
        end
    end
    
    res 
    
end


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# phase_1 O(n!)


def second_anagram?(str1, str2)
    arr = (0...str2.length).to_a
    str1.each_char do |char|
        if str2.index(char).nil? 
            return false 
        else
            arr.delete(str2.index(char))
        end
    end
    arr.empty?
end
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# phase_2 O(n ** 2)

def third_anagram?(str1, str2)
    sorted_1 = str1.chars.sort.join("")
    sorted_2 = str2.chars.sort.join("")
    sorted_1 == sorted_2
    # pretnding we have an alphabet arr
    # sortign both of the strings will be 2 * n * 26
    # sorted_str1.each_char.with_index ele == sorted_str2[i] + n
    # n 
end
# Phase3 O(nlogn)
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2)
    hash = Hash.new(0) 
    str1.each_char { |char| hash[char] += 1 } 
    str2.each_char { |char| hash[char] -= 1 } 
    hash.all? { |k,v| v == 0 } 
end
#Phase4 O(n) 4n + 1
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("gizmo", "sally")    #=> false
# p third_anag
# def anagram(str1, str2) 
#     return fasle if str1.length != str2.length
#     str1.each_char do |char|
#         return false if !str2.inlcude?(char)
#     end
#     true
# end
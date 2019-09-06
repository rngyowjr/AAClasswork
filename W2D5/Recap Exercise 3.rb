require "byebug"
# def no_dupes?(arr)
#     hash = Hash.new(0)
#     arr.each do |ele|
#         hash[ele] += 1
#     end
#     new_arr = []
#     hash.each do |k, v|
#         new_arr << k if v == 1
#     end
#     new_arr
# end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])    

# def no_consecutive_repeats?(arr)
#     (0..arr.length - 1).each do |i|
#         return false if arr[i] == arr[i+1]
#     end
#     true
# end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

# def char_indices(str)
#     hash = Hash.new {|hash, k| hash[k] = []}
#     str.each_char.with_index do |char, i|
#         hash[char] << i 
#     end
#     hash
# end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# def longest_streak(str)
#     hash = Hash.new(0)
#     char_to_repeat = ""
#     times_to_reapeat = 0
#     str.each_char do |char|
#            hash[char] += 1 
#     end
#     str.each_char do |char|
#         if hash[char] >= times_to_reapeat
#             char_to_repeat = char
#             times_to_reapeat = hash[char]
#         end
#     end
#     char_to_repeat * times_to_reapeat  
# end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

# def bi_prime?(num)
#     primes = []
#     (1..num).each do |n|
#        primes << n if prime?(n)
#     end
    
#     primes.each do |prime1|
#         primes.each do |prime2|
#            return true if num == prime1 * prime2
#         end
#     end
#     false
# end
# #prime?
# #array of primes from 2..num
# #outer and innerloop multiply inner with outer to see if it == to num
# def prime?(num)
#     return false if num < 2
#     (2...num).each do |n|
#         return false if num % n == 0
#     end
#     true
# end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

# def vigenere_cipher(str, arr)
#     new_str = ""
#     # count = 0
#     str.each_char.with_index do |char, count|
#         new_str += cipher(char, arr[count % arr.length])
#         # count +=1
#     end

#     new_str

# end

# def cipher(char, num)
#     alpha = ("a".."z").to_a
#     old_idx = alpha.index(char)
#     new_idx = old_idx + num
#     new_char = alpha[new_idx % 26]
#     new_char
# end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# def vowel_rotate(str)
#     vowels = "aieou"
#     first_idx = first_vowel_idx(str)
#     temp = ""
 
# # debugger
#     str.each_char.with_index do |char2, idx2|
#         if vowels.include?(char2)
#             ((idx2 + 1)..str.length - 1).each do |i| 
#                 if vowels.include?(str[i])
#                     temp = str[i]
#                     str[i] = char2
#                     break
#                 end
#             end
#         end
#     end
#     str[first_idx] = temp
#     str
# end

# def first_vowel_idx(str)
#     vowels = "aieou"
#     first_vowel_idx = 0
#    str.each_char.with_index do |char1, idx1|
#         return first_vowel_idx = idx1 if vowels.include?(char1)
#     end
# end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

# class String
#     def select(&prc)
#         prc ||= Proc.new {return ""}
#         new_str = ""
#         self.each_char do |char|
#             new_str += char if prc.call(char)
#         end
#         new_str
#     end
# end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# class String
#     def map!(&prc)
#         self.each_char.with_index do |char, idx|
#             self[idx] = prc.call(char, idx)
#         end
#         self
#     end
# end

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

# def multiply(a, b)
#     return 0 if a == 0 || b ==0
#     sum = 0
#     if b > 0
#         sum += a + multiply(a, b.abs-1)
#     else
#         sum -= a + multiply(a, b.abs-1)
#     end
#     sum
# end

# # base  = 0 - either 0 * b or 0 * a
# # step 1 multiply(3, 1) = 3 == 3 + multiply(3, 0)
# # step 2 multiply(3, 2) = 6 == 3 + multiply(3, 1) + step 1

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

# def lucas_sequence(num)
#     return [] if num == 0
#     return [2] if num == 1
#     return [2, 1] if num == 2
#     new_arr = []
#     new_arr += lucas_sequence(num - 1) 
#     new_arr << new_arr[-1] + new_arr[-2]
#     new_arr
# end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    return [num] if prime?(num)
    factors = []
    (2..num).each do |divisor|
        if num % divisor == 0
            factor_1 = prime_factorization(divisor) # factor_1 =
            factor_2 = prime_factorization(num/divisor) #<== gives the other num ie 30 gotcha ||| factor_2 =
            return [factor_1, factor_2].flatten #this line

        end
    end
end
# step 0 num
# step 1 60 2-60
#     divisor #1 == 2, divisior #2 == 30
# step 3                2-30 
#                         2  15
#                             3 5

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0
    end
    true
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
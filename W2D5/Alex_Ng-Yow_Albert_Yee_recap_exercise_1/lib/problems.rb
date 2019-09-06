# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aeiou"
    v_arr = vowels.split("")
    pairs = []
    # (0...words.length-1).each do |i|
    #     included_vowels = ""
    #     words[i].each_char {|char| included_vowels += char if vowels.include?(char)}
    #     words[i+1].each_char {|char| included_vowels += char if vowels.include?(char)}
    #     if vowels.all? {|char| included_vowels.include?(char)}
    #     pairs << "#{words[i]} #{words[i+1]}"
    # end

    #get all the vowels in both words 
        #find a way to get current word + next word
    # #compare said vowels with all vowels
    # range 
    # word[i] word[i+1]
    # [array of vowels containing word]
    # vowels each incldued? array - false, return false
    
     words.each_with_index do |word1, i1|
         words.each_with_index do |word2, i2|
            if i2 > i1
                included_vowels = ""
                words[i1].each_char {|char| included_vowels += char if vowels.include?(char)}
                words[i2].each_char {|char| included_vowels += char if vowels.include?(char)}
                if v_arr.all? {|char| included_vowels.include?(char)}
                    pairs << "#{words[i1]} #{words[i2]}"
                end
            end
        end
     end
     pairs
end

# 

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return true
        end
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    new_arr = []
    bigrams.each do |bigram|
        new_arr << bigram if str.include?(bigram)
        # str.each_char.with_index do |char, i|
        #     empty = ""
        #     empty += str[i..i+1]
        #     new_arr << empty if bigrams.include?(empty)
        # end
    end
    new_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {}
        
        prc ||= Proc.new {|k, v| new_hash[k] = v if k == v}
        self.each do |k, v|
            new_hash[k] = v if prc.call(k, v)
        end
        
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        new_arr = []
        
        (0..self.length-1).each do |start| 
            (start..self.length-1).each do |ending| 
                new_arr << self[start..ending] 
            end
        end

        if length
            return new_arr.select{|el| el.length == length}
        end
        new_arr
        

    end

#     def greet(person = nil)
#     person = person || "you"
#     p "Hey " + person
# end

# greet("Brian")  # => "Hey Brian"
# greet           # => "Hey you"

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_word = ""
        self.each_char do |char|
            old = alpha.index(char)
            new_i = old + num
            new_word += alpha[new_i % 26]
        end
        new_word
    end
end

def hipsterfy (word)
    vowel = "aeiou"
    i = word.length - 1
    while i >= 0
        if vowel.include?(word[i]) 
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
  vowels = "aeiou"
  hash = Hash.new(0)
  arr = str.split("")
  arr.each do |char|
    if vowels.include?(char.downcase)
      hash[char.downcase] += 1
    end
  end
  hash
end

def caesar_cipher(str, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    letters = str.split("")
    arr = []
    letters.each do |char|
        if !alpha.include?(char)
            arr << char
        else
            old_index = alpha.index(char)
            new_index = (old_index + n) % 26
            arr << alpha[new_index] 
        end
    end
    return arr.join("")
end
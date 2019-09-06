def partition(arr, num)
  big = []
  small = []
  arr.each do |n|
    if n >= num
      big << n 
    else
      small << n
    end
  end
  [small,big]
end

def merge(hash_1, hash_2)
    hash = {}
    hash_1.each do |k, v|
        hash[k] = v
    end
    hash_2.each {|k, v| hash[k] = v}
    return hash 
end

def censor(sent, curses)
  arr = sent.split.map do |word| 
    if curses.include?(word.downcase)
      replace_vowel(word) 
    else
      word
    end
  end
    arr.join(" ")
end

def replace_vowel(word)
  vowels =  "aeiou"
  new = ""
  word.each_char do |char|
    if !vowels.include?(char.downcase)
      new += char
    else
      new += "*"
    end
  end
  new
end

def power_of_two?(num)
    (0..num).each do |i|
        if 2**i == num
            return true
        end
    end
    return false
end


def palindrome?(str)
  str == reverse(str)
end

def reverse(str)
    i = str.length - 1
    new = ""
    while i >= 0
      new += str[i]
      i-=1
    end
    new
end

def substrings(str) 
    arr = []
    str.each_char.with_index do |char1, i1|
        str.each_char.with_index do |char2, i2|
            if i1 == i2
                arr << char1
            elsif i2 > i1
                arr << str[i1..i2]
            end
        end
    end
    return arr
end

def palindrome_substrings(str)
    arr = []
    substrings(str).each do |sub| 
        if palindrome?(sub) && sub.length > 1
            arr << sub
        end
    end
    return arr
end
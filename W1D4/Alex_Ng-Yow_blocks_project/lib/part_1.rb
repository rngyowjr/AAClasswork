def select_even_nums(arr)
    arr.select {|nums| nums.even?}
end

def reject_puppies(arr)
    arr.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|sub| sub.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    new_str = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_str += char + "b" + char
        else
            new_str += char
        end
    end
    new_str
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end
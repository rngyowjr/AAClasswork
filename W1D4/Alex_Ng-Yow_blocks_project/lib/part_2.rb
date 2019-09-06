def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end


def no_valid_url?(arr)
    valid = ['.com', '.net', '.io', '.org']
    arr.none? {|url| valid.include?(url[-4..-1])}
end

def any_passing_students?(arr)
    arr.any? {|student| student[:grades].sum / student[:grades].length > 75}
end
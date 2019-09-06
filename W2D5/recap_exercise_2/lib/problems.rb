# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    factor = 1
    multiple = num_1 * factor #4
    while !(multiple % num_1 == 0 && multiple % num_2 == 0)
        factor += 1
        multiple = num_1 * factor
    end
    multiple
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    (0...str.length - 1).each do |i|
        hash[str[i..i+1]] += 1 
    end
    bigram = ""
    bigram_value = 0
    hash.each do |k, v|
        if v > bigram_value
            bigram = k
            bigram_value = v
        end
    end
    bigram
    # new_arr = hash.sort_by {|k, v| -v} # [[ae, 1], [th, 5]]
    # return new_arr[0][0]
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        #self = an array of numbers
        #counter expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
        self.each_with_index do |ele1, i1|
            self.each_with_index do |ele2, i2|
                if i2 > i1
                    counter += 1 if ele1 + ele2 == num
                end
            end
        end
        counter
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted =false
                end
            end
        end
        self
    end
end

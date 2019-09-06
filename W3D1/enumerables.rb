require "byebug"
# My Each

# Extend the Array class to include a method named my_each that takes a block,
# calls the block on every element of the array, and returns the original array. 
# Do not use Enumerable's each method. I want to be able to write:

 # calls my_each twice on the array, printing all the numbers twice.

class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end
        return self
    end

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end
#     # => 1
#     #    2
#     #    3
#     #    1
#     #    2
#     #    3
  
#   p return_value  # => [1, 2, 3]



# My Select

# Now extend the Array class to include my_select that takes a block and returns a new array 
# containing only elements that satisfy the block.
#  Use your my_each method!


    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele) 
        end
        new_arr
    end


# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

# Example:


    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele) 
        end
        new_arr
    end





# Example:
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# My Any

# Write my_any? to return true if any elements of the array satisfy the block and my_all?
#  to return true only if all elements satisfy the block.

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end


# # Example:
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. 
# Hint: use recursion!

    def my_flatten
        new_arr = []
        
        self.each do |ele|
            if !ele.is_a?(Array)
                new_arr << ele
            else
                new_arr += ele.my_flatten
            end
        end
        new_arr
    end

# Example:

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# My Zip

# Write my_zip to take any number of arguments. 
# It should return a new array containing self.length elements. 
# Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. 
# If the size of any argument is less than self, nil is returned for that location.

    # def my_zip(*args) 
    #     new_arr = Array.new(self.length) { Array.new(args.length + 1)}

    #     p new_arr
    #     self.each_with_index do |char, i|
    #         new_arr[i] = char 
    #     end
    
    #     args.each_with_index do |arr, i1|
    #         arr.each_with_index do |ele, i2|
    #             if i < self.length
    #                 new_arr[i1][i2] = ele
    #             end
    #         end
    #     end
        
    #     # (0..new_arr.length).each do |i|
    #     #     if new_arr[i].length != self.length
                

    #     #     end
    # new_arr
    # end

    def my_zip(*args)

        new_arr = []
        self.each_with_index do |ele, col|
            current = args.map {|arg| col < arg.length ? arg[col] : nil}
            current.unshift(ele)
            new_arr << current
            end
            new_arr
    end



# Example:

# a = [ 4, 5, 6 ]       # 1 2 3            
#                       # 4 5 6           [1,2]
#                       # 7 8 nil         #[4, 5, 6] = [4, 5]
#                                         #[7, 8, 9]
#                                         #[10, 11, 12] 
#                                         #[13, 14, 15]
                      
# b = [ 7, 8, 9 ]
# # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]




# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. 
# By default, the array should rotate by one element. 
# If a negative value is given, 
# the array is rotated in the opposite direction.


    def my_rotate(num=1)
        # num ||= 1
        if num > 0
            i = 0
            while i < num 
                rotater = self.shift
                self.push(rotater) 
                i += 1    
            end
        else 
            (-1 * num).times do 
                rotater = self.pop
                self.unshift(rotater)
            end   
        end
        self
    end

# Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# My Join

# my_join returns a single string containing all the elements of the array,
# separated by the given string separator.
# If no separator is given, an empty string is used.

    def my_join(sep = "")
        # sep ||= ""
        new_str = ""
        self.each do |char| 
            if char == self[-1]
                new_str += char
            else
                new_str += char + sep
            end
        end
        new_str
    end

# Example:

p a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"


# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

    def my_reverse
        new_arr = []
        self.each do |ele|
            new_arr.unshift(ele)
        end
        new_arr
    end

end

# Example:

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
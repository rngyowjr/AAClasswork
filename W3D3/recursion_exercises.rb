#Write a recursive method, range, that takes a start and an end and returns an array
# of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

require "byebug"

def range(start, end_of_range)
    finish = end_of_range - 1
    return [start] if finish == start
    range(start, finish) << finish
end

# p range(1, 5) 
# p range(6, 12) 
# p range(-3, 2)

# Write both a recursive and iterative version of sum of an array.

#iterative
def sum_arr(arr)
    total = 0
    arr.each do |ele|
        total += ele  #total = total + ele
    end
    total
end


#recursive
def rec_sum_arr(arr)
    return nil if arr.empty?
    return arr[0] if arr.length == 1
    rec_sum_arr(arr[1..-1]) + arr[0]
end

# p rec_sum_arr([-2, 2]) # => 0
# p rec_sum_arr([]) # => nil
# p rec_sum_arr([1]) # => 1
# p rec_sum_arr([1, 1]) # => 2
# p rec_sum_arr([3, 5, 5, 4]) #=> 17

#exponentiation
# b: base n: is the exponent
def exp_1(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exp_1(b, n - 1)
end

# p exp_1(4, 2) #=> 16

#exp(b, n) = b * exp(b, n - 1)

#Recursion 2
def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    return exp_2(b, n / 2) ** 2 if n.even?
    b * (exp_2(b, (n - 1) / 2) ** 2)
    

end
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# p exp_2(4, 0) #= 0
# p exp_2(4, 1) #= 1
# p exp_2(4, 2) #= 16
# p exp_2(4, 3) #= 64


def deep_dup(array)
    #return "done" if self.length == 0 #[1, 2, 3, 4]  #[1, [2], 3, 4] # 2, 3, 4] #[13, 4] #[4] []
    new_arr = []
    array.each do |ele|
        if ele.is_a?(Array)
            ele.each do |ele1|
                deep_dup(ele1)
            end
        else 
            new_arr << ele
        end
    end
    new_arr

end

 
    #     self.each do |ele|
    #         if !ele.is_a?(Array)
    #             new_arr << ele
    #         elsif ele.is_a?(Array)
    #             ele.each do |in_el|
    #                 ele << in_el
    #             end
    #         end
    #     end
    # end


# arr1 = [1, [2], [3, [4]]]
# copy = deep_dup(arr1) 
# copy << "LEDs"
# p arr1 #=> [1, [2], [3, [4]]], "LEDs"]
# p copy #=> [1, [2], [3, [4]], "LEDs"] 

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

# clone all parts of an array (outer and inner arrays)

# Write a recursive and an iterative Fibonacci method. The method should take 
# in an integer n and return the first n Fibonacci numbers in an array.

#[1, 1, 2, 3, 5, 8]
#iterative

def fib(n)
    return [1] if n == 0 
    return [1, 1] if n == 2
    arr = [1, 1]
    until arr.length == n
        arr << arr[-1] + arr[-2]
    end
    arr
end
p fib(0) #=> [1]
p fib(2) #=> [1, 1]
p fib(4) #=> [1, 1, 2, 3]
# You shouldn't have to pass any arrays between methods; you should be able to 
# do this just passing a single argument for the number of Fibonacci numbers requested.

def rfib(n)
    return [] if n == 0 
    return [0] if n == 1 
    return [0, 1] if n == 2
    prev = rfib(n - 1)   #rfib(4) = [0, 1, 1]   #rfib(3) = [0, 1]   #rfib(2) = [0, 1]
    prev << prev[-1] + prev[-2]
end

p rfib(4) #=> [0, 1, 1, 2]

#base case: same as iterative vers.
#look at 3 to deduce our inductive step rfib(n - 1)
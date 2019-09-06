def proper_factors(num)
    factors = (1...num).select do |n|
        num % n == 0
    end
    factors
end


def aliquot_sum(num)
    return proper_factors(num).sum
end


def perfect_number?(num)
    return num == aliquot_sum(num)
end

# def ideal_numbers(n)
#     arr = []
#     i = 1
#     until arr.length == n
#         if perfect_number?(i)
#             arr << i
#         end
#         i += 1
#     end
#     return arr
# end

def ideal_numbers(n)
    i = 1
    arr = []
    while arr.length < n
        if perfect_number?(i)
            arr << i
        end
        i += 1
    end
    return arr
end
def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |ele|
        if num % ele == 0
            return false
        end
    end
    true
end

def nth_prime(n)
    checker = 2
    primes = []
    until primes.length == n
        if is_prime?(checker)
            primes << checker
        end
        checker += 1
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    (min..max).each do |num|
        if is_prime?(num)
            primes << num
        end
    end
    return primes
end
def my_reject(arr, &prc)
    arr2 = []
    arr.each do |num|
        if !prc.call(num)
            arr2 << num
        end
    end
    return arr2
end


def my_one?(arr, &prc)
    arr.select {|num| proc.call(num)}.length == 1
end


def hash_select(hash, &prc)
    hash2 = {}
    hash.each do |k, v|
        if prc.call(k, v)
            hash2[k] = v
        end
    end
    return hash2
end


def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |num|
        new_arr << num if (prc1.call(num) || prc2.call(num)) && !(prc1.call(num) && prc2.call(num))
    end
    new_arr
end

def proc_count(num, arr)
    # set up count
    # iterate through array
    # if block true, then count += 1
    # return count
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(num)
    end
    return count
end



def sum_to(n)
    if n > 0
        return 1 if n == 1
        return n + sum_to(n-1)
    else
        return nil
    end
end


def add_numbers(arr)
    return arr[0] if arr.length <= 1
    arr[0] + add_numbers(arr[1..-1])
    
end

def gamma_fnc(n)
    return nil if n.zero?
    return 1 if n == 1
    (n - 1) * gamma_fnc(n - 1)
end


def ice_cream_shop (a, str)
  return false if a.length == 0
  return true if a[0] == str
  a.shift
  ice_cream_shop(a,str)
  
end


def reverse

end


 


def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
  str.upcase + "!"

end

def alternating_case(sent)
  arr = sent.split
  i = 0
  while i < arr.length
    if i % 2 != 0
      arr[i] = arr[i].downcase
    else
      arr[i] = arr[i].upcase
    end
    i +=1
  end 
  arr.join(" ")
end
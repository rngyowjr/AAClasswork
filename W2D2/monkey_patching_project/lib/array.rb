# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        if self.length == 0
            return nil
        end

        return self.max - self.min
    end

    def average
        if self.length == 0
            return nil
        end
           
        return self.sum / (self.length * 1.0)
    end

    def median
        if self.length == 0
            return nil
        end
        sorted = self.sort
        if self.length.odd?
           return sorted[sorted.length / 2]
        elsif self.length.even?
            i = (sorted.length / 2)
            return (sorted[i] + sorted[i - 1]) / 2.0
        end
    end

    def counts 
        hash = Hash.new(0)
        self.each {|el| hash[el] += 1}
        return hash
    end

    def my_count(el)
       hash = self.counts
       return hash[el]
    end

    def my_index(v)
        self.each.with_index do |el, i|
           return i  if v == el

        end
        return nil
    end

    def my_uniq
        new_arr = []
        hash = self.counts
        return hash.keys
    end

    def my_transpose
        new_arr = []
        (0...self.length).each do |idx1|
            arr = []
            (0...self.length).each do |idx2|
                arr << self[idx2][idx1]
            end
            new_arr <<  arr
        end
     new_arr
    end

end
arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]

p arr_1.my_transpose 
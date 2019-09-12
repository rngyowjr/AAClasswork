require "byebug"

class Array
  def my_uniq
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1}
    hash.keys
  end

  def two_sum
    pairs = []
    (0...self.length).each do |i|
     (0...self.length).each do |i2|
        if i2 > i 
          if self[i] + self[i2] == 0
            pairs << [i, i2]
          end
        end
      end
    end
    pairs
  end

  def my_transpose
    arr = []
    self.each_with_index do |row, i| 
      sub = []
      (0...row.length).each {|j| sub << self[j][i]}
      arr << sub
    end
    arr
  end

  def stock_selector
    hash = Hash.new(0)
    self.each_with_index do |num, i|
      (i...self.length).each do |j|
        if self[i] < self[j]
          hash[ [i,j] ] = self[j] - self[i]
        end
      end
    end
    sorted = hash.sort_by {|days, sum| sum}
    sorted[-1][0]
  end
end

class Hanoi

end
require "tdd.rb"

describe "Array" do
  describe "#my_uniq" do
    it "should return an array of unique elements" do
      arr = [1, 2, 1, 3, 3]
      expect(arr.my_uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "should return an array of pairs of indices that sum to zero" do
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "should transpose the array" do
      arr = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8] ]
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe "#stock_selector" do
    it "should return the best day to buy and then sell a stock" do 
      arr = [20, 60, 15, 2, 30, 50]
      expect(arr.stock_selector).to eq([3, 5])
    end 
  end
end

describe "Hanoi" do 
  describe "#initialize" do 

  end

  describe "#move" do 

  end

  describe "#won?" do 

  end
  
end
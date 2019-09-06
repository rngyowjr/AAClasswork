require_relative "Card"

class Board
    attr_accessor :grid, :cards


    def initialize
        @grid = Array.new(5) {Array.new(5)}
        @cards = []
        alpha = ("A".."H").to_a
        while alpha.length > 0
            face = alpha.shift
            2.times {@cards << Card.new(face)}
        end
        @cards.shuffle!
        self.populate
    end

    def render
        rendered = @grid.map do |row|
            row.map do |ele|
                if ele.is_a? Integer
                    ele
                elsif ele.face_up
                    ele.face_val
                else
                    " " 
                end
            end
        end
        rendered.each {|row| puts row.join(" ") } 
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def populate_border
        self[[0,0]] = 0  
        (1...5).each do |i|  
            self[[0,i]] = i 
        end
        
        (1...5).each do |i|  
            self[[i,0]] = i
        end
    end

    def count_nils
        @grid.flatten.count(nil)
    end

    def populate_board
        (1...5).each do |row|  
            (1...5).each do |col|  
                pos = [row, col] 
                self[pos] = @cards.shift
            end
        end
    end
    

    def populate
        self.populate_border
        self.populate_board
    end
end     

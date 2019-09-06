class Board
    attr_reader :size 

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end 

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.each {|arr| arr.each {|ele| count += 1 if ele == :S}}
        count
    end
    
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        # arr = (0...@size).to_a.sample(@size * 0.25)
        # p arr
        # arr.each do |ele|
        #     row = ele%10
        #     col = ele/10
        #     test = [row,col]
        #     p test
        #     self[test] = :S
        # end

        while num_ships != (@size * 0.25)
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        new_arr = Array.new(@grid.length) {Array.new(@grid.length)}
        @grid.each_with_index do |row,i|
            row.each_with_index do |ele,j|
                if ele == :S
                    new_arr[i][j] = :N
                else
                    new_arr[i][j] = ele
                end
            end
        end
        new_arr
    end
    
    def self.print_grid(arr)
        arr.each {|row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end

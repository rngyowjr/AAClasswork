require_relative "Board"



class Game
    attr_reader :counts
    def initialize
        @board = Board.new
        @board.render
        @counts = 0
    end

    def turn_card
        puts "Please enter the position of the card you'd like to flip, (e.g. '2,3'):"
        guess_1 = gets.chomp.split(",").map { |ele| ele.to_i}
        @board[guess_1].face_up = true
        @board.render
        # sleep(2)

        puts "Now pick another position:"
        guess_2 = gets.chomp.split(",").map { |ele| ele.to_i}
        @board[guess_2].face_up = true
        @board.render

        if @board[guess_1].face_val != @board[guess_2].face_val
            @board[guess_1].face_up = false
            @board[guess_2].face_up = false
            puts "Try again!"
        else
            puts "It's a match!"
            @counts += 1
        end

        # sleep(2)
        # system("clear")
        @board.render
    end

    def play_game
        until @counts == 2
            self.turn_card
            puts @counts
        end
        puts "Game Over :)"
    end

end





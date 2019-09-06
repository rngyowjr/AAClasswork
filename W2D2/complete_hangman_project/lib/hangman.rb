class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word =  Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return true if attempted_chars.include?(char) 
    return false
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |ele, i|
      if char == ele
        new_arr << i
      end
    end
    new_arr
  end

  def fill_indices(char, arr)
    @guess_word.each.with_index do |el, i|
       @guess_word[i] = char if arr.include?(i) 
    end
  end

  def try_guess(char)
     
    indicies = get_matching_indices(char)
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    
    fill_indices(char,indicies)
    
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    return try_guess(input)

  end
   
  def win?
     if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    end

    false
  end
  
  def lose?
     if @remaining_incorrect_guesses == 0
        p 'LOSE'
        return true
     end

     false
  end
    
  def game_over?
    
   if  win? || lose?
    p @secret_word
    return true
   end
   return false
  end


end


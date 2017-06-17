# BUSINESS LOGIC - PSEUDOCODE

# define a user class
  # create method to initiate user
    # included attributes
      # name

# define a game class
  # create method to initiate game
    # included attributes:
      # phrase_correct
      # phrase_guess
      # phrase_letters
      # letters_guessed
      # guess_count
      # guess_limit
      # game_over

  # create method to change phrase into new string with underscores in place of letters
  # input - string (phrase)
  # steps:
    # create phrase_correct = given phrase with space added between every character
      # ^^ (this is so that when underscores are used in phrase_guess, each provided space is legible and broken from the underscore next to it, and then the indexes should still match the phrase_guess variable)
    # create phrase_guess = string with the given phrase replaced by underscores for each letter
    # create phrase_letters = array of unique letters in phrase
    # define guess_limit = 3 times the number of unique characters in the given phrase
  # output - new string with underscores in place of letters

  # create method to allow guesser to guess a single letter and show if the letter is included or not and then fill that space with the letter
  # input - letter
  # steps:
    # ask user for letter
    # IF letter has already been guessed
      # tell user this letter has already been guessed.
      # game_over = false
    # ELSE
      # IF letter is included in phrase
        # find the indexes that the letter is included in phrase_correct
        # in the phrase_guess string - replace the underscore with the guessed letter at the same index(es) where the letter is found in phrase_correct
      # ELSE
        # tell user the letter is not in the phrase and to continue guessing
      # guess_counter += 1
      # IF phrase_correct == phrase_guess
        # game_over = true
        # tell user “You win! Great guesses!!”
      #ELSIF guess_counter >= guess_limit
        # game_over = true
        # tell user “Game Over!! Too bad… the correct phrase is <phrase>.”
      # ELSE
        # game_over = false
  # output - phrase_guess string (revised with letters added if guessed correctly)

  # create method to allow guesser to guess the whole phrase
  # input - phrase_guess string
  # steps:
    # ask user for phrase
    # IF phrase = phrase_correct
      # game_over = true
      # tell user “You win! Great guesses!!”
    # ELSE
      # game_over = false
    # guess_counter += 1
  # output - phrase_guess string

# UI - PSEUDOCODE

# create a computer array of random phrases to choose from
# ask for phrase_guesser’s user name
# ask for phrase_giver’s user name or type computer
# define a wrapping method that combines the methods within the game class:
  # call method to ask for provided phrase
  # REPEAT WHILE the game is NOT over
    # ask user if they want to guess a letter or guess the whole phrase
    # IF the guesser wants to guess a letter:
      # call method to guess a single letter
    # ELSIF the guesser wants to guess the phrase:
      # call method to guess a phrase
  # tell user they have used _ number of guesses and have _ number of guesses remaining

# initiate new game class
# call wrapping method on game class instance


class User
  attr_accessor
    :name

  def initialize(name)
    @name = name
  end
end

class Game
  attr_accessor :phrase_correct, :phrase_guess, :phrase_letters, :letters_guessed, :guess_count, :guess_limit, :game_over

  def initialize
    @phrase_correct = ""
    @phrase_guess = ""
    @phrase_letters = []
    @letters_guessed = []
    @guess_count = 0
    @guess_limit = 1
    @game_over = false
  end

  def given_spaces(phrase)
    p "phrase:"
    p phrase
    @phrase_correct = phrase.gsub!(/./) {|x| x + " "}.downcase
    p "phrase correct:"
    p @phrase_correct
    @phrase_guess = phrase_correct.gsub(/[abcdefghijklmnopqrstuvwxyz]/, "_")
    @phrase_letters << phrase_correct.split('').uniq
    @phrase_letters.flatten!.delete(" ")
    @guess_limit = (phrase_letters.length) * 3
    @phrase_guess
  end

  def find_index(letter)
    # letter_indexes = []
    # @phrase_correct.each_char.each_with_index.inject([]) do |char, i|
    #   letter_indexes << i if char == letter
    # end

    letter_indexes = []
    p "phrase correct:"
    p @phrase_correct
    @phrase_correct.split("").map!.with_index do |char, i|
      if @phrase_correct[i] == letter
        letter_indexes << i
      end
    end

    # check_phrase = @phrase_correct.split('')
    # letter_indexes = []
    # x = check_phrase.length
    # (x-1).times do |i|
    #   if check_phrase[i] == letter
    #      letter_indexes.push(i)
    #   end
    # end

    # counter_index = 0
    # while counter_index < @phrase_correct.length
    #   if @phrase_correct[counter_index] == letter
    #     letter_indexes.push(counter_index)
    #   end
    #   counter_index += 1
    # end
    letter_indexes
  end

  def guess_letter(letter)
    if @letters_guessed.index(letter) == nil
      puts "The letter #{letter} has already been guessed."
    elsif @phrase_correct.include?(letter)
      letter_indexes = find_index(letter)
      # letter_indexes.each { |i| @phrase_guess[i] = letter }
      # @phrase_guess[@phrase_correct.index(letter)] = letter
      # @phrase_guess =
    end
    @letters_guessed << letter
    @phrase_guess
  end

end


    # ELSE
      # IF letter is included in phrase
        # find the indexes that the letter is included in phrase_correct
        # in the phrase_guess string - replace the underscore with the guessed letter at the same index(es) where the letter is found in phrase_correct
      # ELSE
        # tell user the letter is not in the phrase and to continue guessing
      # guess_counter += 1
      # IF phrase_correct == phrase_guess
        # game_over = true
        # tell user “You win! Great guesses!!”
      #ELSIF guess_counter >= guess_limit
        # game_over = true
        # tell user “Game Over!! Too bad… the correct phrase is <phrase>.”
      # ELSE
        # game_over = false
  # output - phrase_guess string (revised with letters added if guessed correctly)
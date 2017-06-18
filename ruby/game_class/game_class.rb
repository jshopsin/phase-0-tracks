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
# call all the methods:
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


# BUSINESS LOGIC

class User
  attr_accessor :name

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
    @phrase_correct = phrase.gsub!(/./) {|x| x + " "}.downcase
    @phrase_guess = phrase_correct.gsub(/[abcdefghijklmnopqrstuvwxyz]/, "_")
    @phrase_letters << phrase_correct.split('').uniq
    @phrase_letters.flatten!.delete(" ")
    if phrase_letters.length > 10
      @guess_limit = 20
    else
      @guess_limit = (phrase_letters.length) * 2
    end
    @phrase_guess
  end

  def find_index(letter)
    letter_indexes = []
    @phrase_correct.split("").map.with_index do |char, i|
      if @phrase_correct[i] == letter
        letter_indexes << i
      end
    end
    letter_indexes
  end

  def check_status
    if @phrase_guess == @phrase_correct
      @game_over = true
      p "You win! Great guesses!"
      p "The correct answer is: #{@phrase_correct}."
      p "You guessed this in #{@guess_count} total guesses out of the alloted #{@guess_limit} guesses."
    elsif @guess_count >= @guess_limit
      @game_over = true
      p "You used up all your guesses... Game Over!! The correct answer is: #{@phrase_correct}."
    else
      @game_over = false
      p @phrase_guess
      puts " "
    end
  end

  def guess_letter(letter)
    if @letters_guessed.index(letter) != nil
      p "The letter #{letter} has already been guessed."
      p @phrase_guess
      p " "
    elsif @phrase_correct.include?(letter)
      letter_indexes = find_index(letter)
      letter_indexes.each do |i|
        @phrase_guess[i] = letter
      end
      @guess_count += 1
      p "You have guessed #{@guess_count} times out of #{@guess_limit} total alloted guesses."
      @letters_guessed << letter
      check_status
    elsif !@phrase_correct.include?(letter)
      @game_over = false
      @guess_count += 1
      p "The letter #{letter} is not in the phrase."
      p "You have guessed #{@guess_count} times out of #{@guess_limit} total alloted guesses."
      @letters_guessed << letter
      check_status
    end
  end

  def guess_phrase(phrase)
    phrase = phrase.gsub!(/./) {|x| x + " "}.downcase
    if phrase == @phrase_correct
      @game_over = true
      p "You win! Great guesses!"
      p "The correct answer is: #{@phrase_correct}."
      p "You guessed this in #{@guess_count} total guesses out of the alloted #{@guess_limit} guesses."
    else
      @game_over = false
      @guess_count += 1
      p "That is not the correct phrase."
    end
  end
end

# UI

phrases = ["Hello World", "The World is Flat", "I'm with stupid", "Do not disturb", "Love your enemies", "Save water, drink beer", "No trespassing", "Born this way", "Down to earth", "Love Birds", "Short end of the stick", "up in arms", "like father like son", "on the same page", "curiosity killed the cat", "every cloud has a silver lining", "ugly duckling", "no-brainer", "quick on the draw", "keep your shirt on", "keep calm and carry on", "drawing a blank", "it's raining cats and dogs", "happy as a clam", "go out on a limb", "back to the drawing board", "dropping like flies", "barking up the wrong tree", "quality time", "under the weather", "know the ropes", "on cloud nine", "goody two-shoes", "burst your bubble", "wouldn't harm a fly", "you can't teach an old dog new tricks", "it's not all it's cracked up to be", "swinging for the fences", "man of few words", "cut to the chase", "quick and dirty", "talk the talk", "down to the wire", "close but no cigar", "you can't judge a book by its cover", "birds of a feather flock together", "two down, one to go", "rain on your parade", "elvis has left the building", "wake up call", "my cup of tea", "under your nose", "an arm and a leg", "roll with the punches"]

puts "What is the name of the person who will be guessing letters?"
guesser_name = gets.chomp
guesser = User.new(guesser_name)

puts "What is the name of the person who will be giving a phrase? If you would like a randomly generated phrase instead, type 'computer'."
giver_name = gets.chomp
giver = User.new(giver_name)

if giver.name == "computer"
  given_phrase = phrases.sample
else
  puts "#{guesser.name}, look away."
  puts "#{giver.name}, type in a phrase for #{guesser.name} to guess."
  given_phrase = gets.chomp
  puts "Thank you, #{guesser.name} can look again."
end

game = Game.new
phrase_guess = game.given_spaces(given_phrase)
puts " "
puts "Guess letters to fill in the blanks:"
p phrase_guess
puts " "
until game.game_over == true
  puts "#{guesser.name}, would you like to guess a letter or a phrase? Type 'l' for letter OR 'p' for phrase."
  answer = gets.chomp
  if answer == "l"
    puts "What letter would you like to guess?"
    letter = gets.chomp.downcase
    phrase_guess = game.guess_letter(letter)
  elsif answer == "p"
    puts "What phrase would you like to guess?"
    phrase = gets.chomp.downcase
    phrase_guess = game.guess_phrase(phrase)
  else
    puts "Unexpected input..."
  end
end

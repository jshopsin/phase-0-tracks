# BUSINESS LOGIC - PSEUDOCODE

# define a user class
  # create method to initiate user
    # included attributes
      # name

# define a game class
  # create method to initiate game
    # included attributes:
      # phrase
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
    # define guess_limit = 3 times the number of unique characters in the given phrase OR 2 times the number of unique characters in the given phrase if 3 times is greater than 75% of the length of the alphabet
  # output - new string with underscores in place of letters

  # create method to allow guesser to guess a single letter and show if the letter is included or not and then fill that space with the letter
  # input - phrase_guess string
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

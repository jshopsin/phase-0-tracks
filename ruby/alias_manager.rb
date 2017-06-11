# This is my revised code after the comments I received from submitting the code that can be found at the very bottom of this file. I wanted to redo the assignment addressing these comments so I could learn the correct way to use built in method and how to properly psuedocode.

# PSUEDOCODE - method:

# create a method that takes a spy's real name as the parameter (spy_name)
# input: string
# steps:
  # SPLIT the name into first and last name + DOWNCASE
  # ROTATE the first and last name in the array
  # JOIN the words back together as a string
# END spy_name method
# output: string

# create a method to swap the vowels (swap_vowels)
# input: string
# steps:
  # create a hash with vowels as keys and their replacement as values
  # for EACH letter in the string DO
    # use HAS_KEY? to search if the letter is in the vowel hash
    # replace the character with its value pair in the hash
  # END each do method
# END swap_vowels method
# output: string

# create a method to swap the consonants (swap_consonants)
# input: string
# steps:
  # for EACH letter in the string DO
    # IF it is an edge condition of "d" || "h" || "n" || "t"
      # use .NEXT.NEXT method to advance to the next letter that is not a vowel
    # ELSIF it is an edge condition of "z"
      # replace with "b"
    # ELSIF use HAS_KEY? to search if the letter is NOT in the vowel hash
      # use .NEXT method to advance to the next letter
    # END if, elsif statement
  # END each do method
# END swap_consonants method
# output: string

# create a method to wrap above methods (encrypt_spy_name)
# input: string
# steps:
  # spy_name method with name as parameter
  # swap_vowels method with name as parameter
  # swap_consonants method with name as parameter
  # print the encrypted name
# END encrypt_spy_name method
# output: string

def spy_name(name)
  name_split = name.to_s.downcase.split(' ')
  name_split.rotate!(1)
  name = name_split.join(' ')
end

def swap_vowels(name)
  vowels = {"a" => "e","e" => "i","i" => "o","o" => "u","u" => "a"}
  name_chars = name.chars
  name_chars.map! {|i|
    if vowels.has_key?(i)
      vowels[i]
    else i
    end
  }
  vowel_name = name_chars.join('')
end

def swap_consonants (name)
  vowels = {"a" => "e","e" => "i","i" => "o","o" => "u","u" => "a"}
  name_chars = name.chars
  name_chars.map! {|i|
    if vowels.has_key?(i)
      i
    elsif i == "z"
      i = "b"
    elsif i == "d" || i == "h" || i == "n" || i == "t"
      i = i.next.next
    elsif i == " "
      i
    elsif vowels.has_key?(i) == false
      i = i.next
    end
  }
  consonant_name = name_chars.join('')
end

def encrypt_spy_name(name)
  name = spy_name(name)
  name = swap_vowels(name)
  name = swap_consonants(name)
  p name.split.map(&:capitalize).join(' ')
end

# encrypt_spy_name("Zendia Juice")

# PSUEDOCODE - UI and storing data for recall at end:

# create empty hash to store requested name as a key with the encrypted name as the value
# ask user for a spy's name to encrypt
# let them know that they can continue to enter new names and can type quit to end

# create a loop that continues to take a real name UNTIL user inputs "quit"
  # create variable encrypted_name that equals the encrypt_spy_name method with the requested name as the parameter
  # store requested_name to the key value of the hash and the encrypted_name as its value in the hash
  # get another name and continue the loop
# END loop

# return the final stored names as a string with each key and value stored in the hash

stored_names = {}
puts "What name would you like encrypted? Please enter a first and last name. You can continue to encrypt new names by hitting enter. Type quit to stop."
requested_name = gets.chomp!.split.map(&:capitalize).join(' ')
until requested_name == "Quit" do
  encrypted_name = encrypt_spy_name(requested_name)
  stored_names.store(requested_name, encrypted_name)
  requested_name = gets.chomp!.split.map(&:capitalize).join(' ')
end

p stored_names.each {|key, value| puts "#{key} is encrypted to #{value}"}


=begin

Below is the code that I had previously submitted. After the comments I received, I wanted to redo the assignment addressing these comments so I could learn the correct way to use built in method and how to properly psuedocode.

# RELEASE 0

# Create method that takes spy's real name.
def spy_name(name)
  # Split the name into first and last name + downcase
  name_split = name.to_s.downcase.split(' ')
  # Swap the first and last name
  name_split.rotate!(1)
  # Create an array of vowels
  # Create an array of consonants
  vowels = ["a", "e", "i", "o", "u"]
  consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  # Split the name into characters
  new_name = name_split.join(' ')
  name_chars = new_name.chars
  # Loop through the array until all characters have been changed
  i = 0
  while i < name_chars.length
    # Take care of edge cases
    if name_chars[i] == "z"
      name_chars[i] = "b"
    elsif name_chars[i] == "u"
      name_chars[i] = "a"
    # If the character is a vowel, change it to the next vowel
    elsif vowels.include?(name_chars[i])
      vowel_index = vowels.index(name_chars[i]).to_i
      name_chars[i] = vowels[vowel_index + 1]
    # If the character is a consonant, change it to the next consonant
    elsif consonants.include?(name_chars[i])
      cons_index = consonants.index(name_chars[i]).to_i
      name_chars[i] = consonants[cons_index + 1]
    end
    i += 1
  end
  # Join the characters back together
  final_name = name_chars.join
  # Print the new name
  p final_name.split.map(&:capitalize).join(' ')
end

spy_name("Jennifer Shopsin")

# RELEASE 1 - Provide a User Interface

requested_names = []
encrypted_names = []
puts "What name would you like encrypted? Please enter a first and last name. You can continue to encrypt new names by hitting enter. Type quit to stop."
requested_name = gets.chomp!.downcase
until requested_name == "quit" do
  encrypted_name = spy_name(requested_name)
  # Store names for Release 2
  requested_names << requested_name
  encrypted_names << encrypted_name
  # Continue to accept new requested names
  requested_name = gets.chomp!.downcase
end

# RELEASE 2 - Store Data and Recall names that have been requested with their respective encrypted name

puts "Thank you for your requested encrypted names. The following names have been encrypted:"
i = 0
while i < requested_names.length
  p "#{requested_names[i]} is encrypted to #{encrypted_names[i]}."
  i += 1
end

=end
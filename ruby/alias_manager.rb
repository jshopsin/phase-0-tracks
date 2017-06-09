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

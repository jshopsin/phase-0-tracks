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

    # If the character is a vowel, change it to the next vowel
    if vowels.include?(name_chars[i])
      vowel_index = vowels.index(name_chars[i])
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
  p final_name

end

spy_name("Jennifer Shopsin")
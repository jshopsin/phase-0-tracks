#Define the string.
#Write out each letter of the string.
#Use the .next method to change the string to
#advance each letter.
#If it equals a space, then puts a space.
#The expected output is the string with each
#letter advanced one over.

def encrypt(password)
  index = 0
  while index < password.length do
    if password[index] == " "
      password[index] = " "
    elsif password[index] == "z"
      password[index] = "a"
    else
      password[index] = password[index].next
    end
    index += 1
  end
  p password
end

encrypt("abc")
encrypt("zed")

#Define the string.
#Use the index on the string
#Compare it to variable of the string alphabet.
#To determine the letters index.
#Then replace with the letter of the index number prior.
#If there is a space, it will put a space.
#The expected output is the string with each
#letter changed to the previous letter.

def decrypt(d_password)
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  while index < d_password.length
    if d_password[index] == " "
      d_password[index] = " "
    else
      a = alphabet.index(d_password[index])
      d_password[index] = alphabet[a - 1]
    end
    index += 1
  end
  p d_password
end

decrypt("bcd")
decrypt("afe")

decrypt(encrypt("swordfish"))

#Nested methods do not work, so neither will this.


# RELEASE 5 - ADD AN INTERFACE

#Asks a secret agent (the user) whether they would like to decrypt or encrypt a password

puts "Would you like to encrypt or decrypt a password? Input encrypt or decrypt."
answer = gets.chomp

#Asks them for the password

puts "What is the password?"
password_request = gets.chomp.to_s

#Conducts the requested operation, prints the result to the screen, and exits

while answer == "encrypt" || answer == "decrypt" do
  if answer == "encrypt"
    puts encrypt(password_request)
    break
  elsif answer == "decrypt"
    puts decrypt(password_request)
    break
  else
    puts "Please answer encrypt or decrypt."
    answer = gets.chomp!
    break
  end
end


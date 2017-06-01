# Check if potential employee's name is found in the Werewolf Intelligence Bureau database of known vampires in the area.

puts "What is your name?"
name = gets.chomp

# Check to see if potential employee knows the correct year correlated with the age they give. This is to try to trick the vampire, who is likely several hundreds of years old. If an employee gives an age and a year of birth that don’t line up mathematically, that employee might be a vampire.

current_year = 2017

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
year = gets.chomp.to_i

if age == (current_year - year)
  age_correct = true
else
  age_correct = false
end

# Check to see if potential employee would like garlic bread. Vampires hate garlic.

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_bread = gets.chomp

until garlic_bread == "yes" || garlic_bread == "y" || garlic_bread == "no" || garlic_bread == "n" do
  puts "Please answer yes or no"
  garlic_bread = gets.chomp!
end

if garlic_bread == "yes" || "y"
  weres_like_garlic = true
else garlic_bread == "no" || "n"
  weres_like_garlic == false
end

# Check to see if the potential employee would want health insurance. Vampires are immortal and would not need health insurance.

puts "Would you like to enroll in the company’s health insurance?"
insurance = gets.chomp

until insurance == "yes" || insurance == "y" || insurance == "no" || insurance == "n" do
  puts "Please answer yes or no"
  insurance = gets.chomp!
end

if insurance == "yes" || "y"
  weres_mortal = true
else insurance == "no" || "n"
  weres_mortal == false
end



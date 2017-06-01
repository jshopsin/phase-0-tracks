# PROCESS MULTIPLE EMPLOYEES

# Ask the user how many employees will be processed, then begin the survey process for the first employee.

puts "How many employees will be processed at this time?"
employee_number = gets.chomp.to_i


# START SURVEY LOOP

employee_number.times do

  # Check if potential employee's name is found in the Werewolf Intelligence Bureau database of known vampires in the area.

  puts "What is your name?"
  name = gets.chomp

  if name == "Drake Cula" || name == "Tu Fang"
    vamp_name = true
  else
    vamp_name = false
  end

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

  # CHECK FOR SUSPICIOUS ALLERGIES

  # Ask potential employees about their allergies, one at a time. Type "done" when finished.

  puts "Do you have any allergies? Please enter one at a time and type \"done\" when finished."
  allergies = gets.chomp
  until allergies == "done" || allergies == "sunshine"  || allergies == "sun" do
    allergies = gets.chomp!
  end

  # If at any point the employee lists “sunshine” as an allergy, skip directly to the result of “Probably a vampire.” (The skip directly to result is why it's important that this is placed before the conditionals to follow.)

  if allergies == "sunshine" || allergies == "sun"
      puts "Probably a vampire."


  # CONDITIONALS TO DETERMINE WEREWOLF VS VAMPIRE

  # If the employee got their age right, and is willing to eat garlic bread or sign up for insurance, the result is “Probably not a vampire.”

  elsif age_correct == true && (weres_like_garlic == true || weres_mortal == true)
    puts "Probably not a vampire."

  # If the employee got their age wrong, and hates garlic bread or waives insurance, the result is “Probably a vampire.”

  elsif age_correct == false && (weres_like_garlic == false || weres_mortal == false)
    puts "Probably a vampire."

  # If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, the result is “Almost certainly a vampire.”

  elsif age_correct == false && weres_like_garlic == false && weres_mortal == false
    puts "Almost certainly a vampire."

  # Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, you should print “Definitely a vampire.”

  elsif vamp_name == true
    puts "Definitely a vampire."

  # Otherwise, print “Results inconclusive.”

  else
    puts "Results inconclusive."
  end

# Don't forget to end the survey loop!

end
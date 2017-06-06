# Create Client Listing
client = {

  # Client's name
  name: "Jennifer Shopsin",

  # Client's age
  age: 40,

  # Number of Children
  children: 2,

  # Renovation or New Construction
  renovation: true,

  # Project Type
  proj_type: "residential",

  # Project Address
  proj_address: "123 Address St",

  # Square Footage of Project
  sf: 2800,

  # Decor Theme
  decor_theme: "Carribean",

  # Budget
  budget: 500000,

  # First-time Client
  first_time_client: true,

# don't forget to close the hash
}

puts "Welcome to Interior Design Studio, please input the following information about yourself and your project."
puts "What is your name?"
client[:name] = gets.chomp.capitalize.to_s

puts "#{client[:name]}, how old are you?"
client[:age] = gets.chomp.to_i

puts "Thank you #{client[:name]}, how many children do you have?"
client[:children] = gets.chomp.to_i

puts "Will this project be a renovation or a new construction?"
reno_answer = gets.chomp.downcase.to_s
until reno_answer == "renovation" || reno_answer == "new construction"
  puts "Please answer with renovation or new construction."
  reno_answer = gets.chomp.downcase.to_s
end
if reno_answer == "renovation"
  client[:renovation] = true
else
  client[:renovation] = false
end

puts "What is the type of project?"
client[:proj_type] = gets.chomp.capitalize.to_s

puts "What is the project address?"
client[:proj_address] = gets.chomp.capitalize.to_s

puts "What is the total square feet for the project?"
client[:sf] = gets.chomp.to_i

puts "Thank you for all of this information, we are almost done."
puts "What is the decor theme you would like for this project?"
client[:decor_theme] = gets.chomp.capitalize.to_s

puts "What is the budget for the interior design scope of work?"
client[:budget] = gets.chomp.to_i

puts "Is this the first time you are working with us? Please answer yes or no."
first_time = gets.chomp.downcase.to_s
until first_time == "yes" || first_time == "no"
  puts "Please answer yes or no. Is this the first time you are working with us?"
  first_time = gets.chomp.downcase.to_s
end
if first_time == "yes"
  client[:first_time_client] = true
else
  client[:first_time_client] = false
end

puts "Thank you #{client[:name]} for all of this information. We will be in touch with you soon!"

p client
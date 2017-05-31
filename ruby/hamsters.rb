puts "What is the hamster's name?"
hamster_name = gets.chomp

puts "How loud is #{hamster_name} on a scale of 1 to 10"
volume_level = gets.chomp.to_i

puts "What color fur does #{hamster_name} have?"
fur_color = gets.chomp

puts "Is #{hamster_name} a good candidate for adoption? Please answer yes or no."
candidate = gets.chomp

puts "What is #{hamster_name}'s estimated age in years?"
estimated_age = gets.chomp
if estimated_age.empty?
  estimated_age = nil
else
  estimated_age.to_i
end

puts "Hamster's name: #{hamster_name}"
puts "Volume level: #{volume_level}"
puts "Fur color: #{fur_color}"
puts "Candidate for adoption?: #{candidate}"
puts "Estimated age: #{estimated_age}"

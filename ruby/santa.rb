class Santa

  def initialize(name, gender, ethnicity)
    puts "Initializing Santa instance ... #{name} has been added."
    @name = name
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak()
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

end

santas = []

santas << Santa.new("Shirley","female", "N/A")
santas << Santa.new("Hampton","male", "White")
santas << Santa.new("Rudolph","male", "Dog")
santas << Santa.new("Lauren","bigender", "Japanese")
santas << Santa.new("Hugh","male", "English")
santas << Santa.new("Sarah","female", "Elf")

p santas

# santa = Santa.new

# puts santa.speak
# puts santa.eat_milk_and_cookies("Chocolate Chip")
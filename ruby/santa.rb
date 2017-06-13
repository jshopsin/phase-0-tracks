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

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    if @reindeer_ranking.include?(reindeer)
      @reindeer_ranking.delete(reindeer)
      @reindeer_ranking << reindeer
    end
  end

  # setter methods
  def gender= (new_gender)
    @gender = new_gender
  end

  # getter methods
  def name
    @name
  end

  def gender
    @gender
  end

  def age
    @age
  end

  def ethnicity
    @ethnicity
  end

  def reindeer_ranking
    @reindeer_ranking
  end
end

santas = []

santas << Santa.new("Shirley","female", "N/A")
santas << Santa.new("Hampton","male", "White")
santas << Santa.new("Rudolph","male", "Dog")
santas << Santa.new("Lauren","bigender", "Japanese")
santas << Santa.new("Hugh","male", "English")
santas << Santa.new("Sarah","female", "Elf")

santas[1].gender = "jock male"
santas[1].celebrate_birthday

puts "#{santas[1].name} is a #{santas[1].gender} who is #{santas[1].age} years old."

santas[2].get_mad_at("Rudolph")
puts "#{santas[2].name}'s reindeer ranking is #{santas[2].reindeer_ranking}."

santas[3].get_mad_at("Hershel")
puts "#{santas[3].name}'s reindeer ranking is #{santas[3].reindeer_ranking}."

# p santas

# santa = Santa.new

# puts santa.speak
# puts santa.eat_milk_and_cookies("Chocolate Chip")
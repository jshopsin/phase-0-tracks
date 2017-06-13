class Santa
  attr_reader :reindeer_ranking
  attr_accessor :name, :gender, :age, :ethnicity

  def initialize(name, gender, ethnicity)
    puts "Initializing Santa instance ... #{name} has been added."
    @name = name
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer",
      "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
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
end

def create_santas(num_of_santas)
  example_names = ["Sophia",    "Noah",     "Emma",      "Liam",
    "Olivia",      "Ava",       "Isabella", "Mia",       "Elijah",
    "Mason",       "Michael",   "Aiden",    "James",     "Jacob",
    "Logan",       "Lucas",     "Matthew",  "Benjamin",  "Ethan",
    "William",     "Alexander", "Jayden",   "Daniel",    "Charlotte",
    "Oliver",      "Carter",    "Abigail",  "Amelia",    "Sebastian",
    "Joseph",      "Harper",    "David",    "Anthony",   "Madison",
    "Jackson",     "Gabriel",   "Julian",   "Emily",     "Dylan",
    "Christopher", "Grayson",   "Samuel",   "Luke",      "Josiah",
    "Evelyn",      "Wyatt",     "Aria",     "Christian", "Joshua",
    "Jaxon",       "Ryan",      "Sofia",    "Andrew",    "Isaiah",
    "Isaac",       "Victoria",  "Nathan",   "John",      "Elizabeth",
    "Scarlett",    "Owen",      "Caleb",    "Layla",     "Ella",
    "Camila",      "Mateo",     "Zoey",     "Eli",       "Landon",
    "Aaron",       "Hunter",    "Jeremiah", "Chloe",     "Adrian",
    "Levi",        "Henry",     "Cameron",  "Thomas",    "Skylar",
    "Skye",        "Brayden",   "Brandon",  "Lincoln",   "Jack",
    "Lily",        "Nicholas",  "Brooklyn", "Penelope",  "Grace",
    "Aaliyah",     "Jonathan",  "Dominic",  "Mila",      "Connor",
    "Jaxson",      "Jordan",    "Bryson",   "Robert",    "Lillian",
    "Natalie",     "Charles",   "Xavier",   "June",      "Jessica"]

  example_genders = ["female",      "male",   "bigender",   "cisgender",
                     "transgender", "genderqueer"]

  example_ethnicities = [      "Caucasian",  "Latino",  "Japanese",
    "Chinese",   "Korean",     "Elf",        "Dog",     "Unicorn",
    "Pirate",    "British",    "Indian",     "Israeli", "Taiwanese",
    "Filipino",  "German",     "Irish",      "Italian", "Lithuanian",
    "Norwegian", "Punjabi",    "Portuguese", "Russian", "Scottish",
    "Turkish",   "Vietnamese", "Welsh"]

  example_age = (0..140).to_a
  santas = []
  num_of_santas.times do |i|
    santas << Santa.new(example_names.sample,example_genders.sample, example_ethnicities.sample)
    santas[i].age = example_age.sample
    puts "#{santas[i].name} is #{santas[i].gender}, #{santas[i].ethnicity} and is #{santas[i].age} years old."
  end
  santas
end

santas = create_santas(100)

# p santas

santas[1].gender = "jock male"
santas[1].celebrate_birthday

puts "#{santas[1].name} is a #{santas[1].gender} who is #{santas[1].age} years old."

santas[2].get_mad_at("Rudolph")
puts "#{santas[2].name}'s reindeer ranking is #{santas[2].reindeer_ranking}."

santas[3].get_mad_at("Hershel")
puts "#{santas[3].name}'s reindeer ranking is #{santas[3].reindeer_ranking}."



# santas << Santa.new("Shirley","female", "N/A")
# santas << Santa.new("Hampton","male", "White")
# santas << Santa.new("Rudolph","male", "Dog")
# santas << Santa.new("Lauren","bigender", "Japanese")
# santas << Santa.new("Hugh","male", "English")
# santas << Santa.new("Sarah","female", "Elf")

# p santas

# santa = Santa.new

# puts santa.speak
# puts santa.eat_milk_and_cookies("Chocolate Chip")

# RELEASE 2's Getter and Setter methods that were removed in RELEASE 3's Refactoring with attr_reader and attr_accessor
  # setter methods
  #   def gender= (new_gender)
  #     @gender = new_gender
  #   end

  # getter methods
  #   def name
  #     @name
  #   end

  #   def gender
  #     @gender
  #   end

  #   def age
  #     @age
  #   end

  #   def ethnicity
  #     @ethnicity
  #   end

  #   def reindeer_ranking
  #     @reindeer_ranking
  #   end
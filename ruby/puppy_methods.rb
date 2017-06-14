# Release 0:
class Puppy

  def initialize
    p "Initializing new puppy instance ..."
  end

    def fetch(toy)
      puts "I brought back the #{toy}!"
      toy
    end

  def speak(int)
    int.times do
      p "Woof!"
    end
  end

  def roll_over
    p "*rolls over*"
  end

  def dog_years(int)
    p int*7
  end

  def jump(feet)
    p "I jumped #{feet} feet!"
  end

end

puppy = Puppy.new

puppy.fetch("ball")
puppy.speak(5)
puppy.roll_over
puppy.dog_years(3)
puppy.jump(2)

# Release 1:
# Add initialize

# Release 2:
class Kitty
  def initialize
    p "Initializing new kitty instance ..."
  end

  def play(toy)
    p "The kitty loves to play with #{toy}!"
  end

  def chase(thing)
    p "The kitty is chasing the #{thing}!"
  end
end

# kitty = Kitty.new

def create_kitty(number)
  kitties = []
  number.times do
    kitties << Kitty.new
  end
  kitties
end

kitties = create_kitty(50)

kitties.each do |i|
  toys = ["string", "cotton balls", "yarn", "food", "feathers"]
  things = ["laser pointer", "mouse", "rat", "flies", "spiders"]
  i.play(toys.sample)
  i.chase(things.sample)
end

kitties[2].play("cotton ball")
kitties[3].chase("mouse")
kitties[5].play("yarn")
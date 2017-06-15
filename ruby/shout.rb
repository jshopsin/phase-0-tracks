# RELEASE 2 - Convert Standalone Module to a Mixin

module Shout
  def yell_angrily(words)
    puts "#{words}!!! :("
  end

  def yelling_happily(words)
    puts "#{words}!!! :D"
  end
end

class Child
  include Shout
end

class Parent
  include Shout
end

shirley = Child.new
luke = Child.new
mom = Parent.new
dad = Parent.new

shirley.yell_angrily("I'm so hungry! Waaahh")
mom.yelling_happily("I'm just so in love with my new baby")
luke.yelling_happily("Goal")
dad.yell_angrily("Don't play inside the house")

# RELEASE 1 - Write a Simple Module

# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     words + "!!!" + " :D"
#   end
# end

# puts Shout.yell_angrily("I'm so angry")
# puts Shout.yelling_happily("I'm so happy right now")
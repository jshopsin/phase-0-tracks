# Virus Predictor

# I worked on this challenge:
# [by myself(Jennifer Shopsin), with: Fulton Zink].
# We spent [1] hour on this challenge.

# EXPLANATION OF require_relative
# require allows you to link existing modules to have access to the methods within
# require_relative allows you to link local files to have access to the data within

require_relative 'state_data'

class VirusPredictor

  # stores given data per state_of_origin into each instance that is created

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # wrapping method that calls the predicted deaths and speed of spread methods

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  # Internal Logic
  private

  # calculates the number of deaths based on a conditional of the population density

  def predicted_deaths
    # predicted deaths is solely based on population density
    case @population_density
      when @population_density >= 200 then number_of_deaths = (@population * 0.4).floor
      when @population_density >= 150 then number_of_deaths = (@population * 0.3).floor
      when @population_density >= 100 then number_of_deaths = (@population * 0.2).floor
      when @population_density >= 50 then number_of_deaths = (@population * 0.1).floor
      else number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # gives a specific value to speed of the spread of a virus based on the population density of that state (instance)

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    case @population_density
      when @population_density >= 200 then speed = 0.5
      when @population_density >= 150 then speed = 1
      when @population_density >= 100 then speed = 1.5
      when @population_density >= 50 then speed = 2
      else speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

# USER INTERFACE

STATE_DATA.each do |state, data|
  state = VirusPredictor.new(state, data[:population_density], data[:population])
  state.virus_effects
end


=begin
#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

#=======================================================================

# Reflection Section

What are the differences between the two different hash syntaxes shown in the state_data file?
  One uses a string with a hash rocket, and the other is a symbol. The string and hash rocket have been the method to write keys in hashes until more recently when symbols were added as an excepted way of writing a key. Symbols are more heavily used in Rails.

What does require_relative do? How is it different from require?
  Require relative allows you to link local files in order to have access to the data within; whereas, require allows you to link existing modules to have access to the methods within(i.e. CSV, Time, Money, etc.).

What are some ways to iterate through a hash?
  each{|key,value| block } -> hsh
  while, until, loop
  select{|key,value| block } -> hsh

When refactoring virus_effects, what stood out to you about the variables, if anything?
  I immediately noticed (before it asked us to refactor) that it was very strange to have the instance variables given as parameters to pass into the methods, when in fact since they are instance variables they will be available to each instance of the class and are available thoughout the code of the class. There was no need for any parameters in these methods.

What concept did you most solidify in this challenge?
  Scope of local and global variables and how there is access to the state_data file using require_relative, and the STATE_DATA variable has to be written in all caps to show that this is a constant.

=end
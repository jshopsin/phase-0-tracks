# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----

zombie_apocalypse_supplies.map { |i| print "#{i} * " }

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----

def sort(array)
  x = array.length
  swapped = true
  while swapped do
    swapped = false
    (x-1).times do |i|
      if array[i][0].downcase > array[i+1][0].downcase
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
  end
  p array
end

sort(zombie_apocalypse_supplies)

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----

def find(array, item)
  found = true
  while found do
    array.length.times do |i|
      found = false
      if array[i].downcase == item
        found = true
      end
    end
  end
  item.capitalize!
  if found
    puts "#{item} is in the array."
  else puts "#{item} is not in the array."
  end
end

p find(zombie_apocalypse_supplies, "boots")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----

def num_items(arr, num)
  until arr.length == num do
    arr.delete_at(-1)
  end
  p arr
end

num_items(zombie_apocalypse_supplies, 5)


# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----

combined_supplies = (zombie_apocalypse_supplies << other_survivor_supplies).flatten!.uniq!

sort(combined_supplies)


# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----

puts extinct_animals.each {|animal, year_extinct| puts "#{animal} - #{year_extinct}"}

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----

def extinct_by(hash, num)
  p hash.reject{|key, value| value < num}
end

extinct_by(extinct_animals,2000)

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

def fix_year(hash, n)
  puts hash.each {|animal, year| hash[animal] = year.to_i + n}
end

fix_year(extinct_animals, -3)

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

def find_animal(hash, animal)
  animal = animal.split.map(&:capitalize).join(' ')
  x = hash.length
  found_animal = true
  while found_animal do
    found_animal = false
    if hash.has_key?(animal)
      found_animal = true
      break
    end
  end
  if found_animal
    puts "According to our records, #{animal}'s are extinct."
  else puts "According to our records, #{animal}'s are not extinct."
  end
end

find_animal(extinct_animals, "Andean Cat")
find_animal(extinct_animals, "Dodo")
find_animal(extinct_animals, "Saiga Antelope")


# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----

def remove_animal(hash)
  not_extinct = []
  if hash.has_key?("Passenger Pigeon")
    not_extinct << "Passenger Pigeon"
    not_extinct << hash["Passenger Pigeon"]
    hash.delete_if {|animal, year| animal == "Passenger Pigeon"}
  end
  # p hash
  p not_extinct
end

remove_animal(extinct_animals)
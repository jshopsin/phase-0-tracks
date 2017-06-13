# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # seperate individual items from input and store it in a hash
  # set default quantity to each keyed item
  # print the hash to the console [can you use one of your other methods here?]
# output: hash

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
  # add item name and quantity to list
  # print the hash to the console
# output: revised hash

# Method to remove an item from the list
# input: list, item
# steps:
  # remove that item from the hash
  # print the hash to the console
# output: revised hash

# Method to update the quantity of an item
# input: list, item, quanitity
# steps:
  # find the item in the hash
  # change the value to the new quanitity
  # print the hash to the console
# output: revised hash

# Method to print a list and make it look pretty
# input: list
# steps:
  # print each item and quanitity from the hash
# output: pretty list



def create_list(items)
  items = items.split(' ')
  grocery_list = {}
  items.each do |item|
    grocery_list[item] = 1
  end
  p grocery_list
  grocery_list
end

def add_item(list, item, quantity)
  list[item] = quantity
end

def remove_item(list, item)
  list.delete(item)
end

def update_quantity(list, item, quantity)
  if list.include?(item)
    list[item] = quantity
  end
end

def print_list(list)
  list.each do |item, quantity|
    item = item.split.map(&:capitalize).join(' ')
    puts "#{item}: #{quantity}"
  end
end

grocery_list = create_list("")

p add_item(grocery_list, "lemonade", 2)
add_item(grocery_list, "tomatoes", 3)
add_item(grocery_list, "onions", 1)
add_item(grocery_list, "ice cream", 4)

remove_item(grocery_list, "lemonade")

update_quantity(grocery_list, "ice cream", 1)
update_quantity(grocery_list, "apples", 5)

print_list(grocery_list)


# RELEASE 4 - REFLECT

# What did you learn about pseudocode from working on this challenge?
  # I had already practiced psuedocoding in this syntax, and it was good to practice it more. I learned that it is less important the specific language you use in your psuedocode, and more important to get each of the steps in as simply as possible.
# What are the tradeoffs of using arrays and hashes for this challenge?
  # I used hashes rather than an array so that the quantity of each item is paired with the item itself in a hash. An array would only make a list of the items, without the quantity. I did use a .split method on the original string though which transforms it into an array, and then I pushed each item of that array into keys with a default quantity (value) of 1.
# What does a method return?
  # Each of these methods returned the revised list as a hash; except for the print method which puts each item and quantity rather than the overall hash.
# What kind of things can you pass into methods as arguments?
  # You can pass any type of ruby object into a method as arguments (strings, integers, floats, arrays, hashes, etc.)
# How can you pass information between methods?
  # In order to pass information between methods, you can call a method within another method, or set a variable equal to the method (i.e. grocery_list) so that there is a global variable to call on for each method. The grocery_list variable on line 70 is a global variable that is being called on in the other methods. The grocery_list within the create_list method is a local variable and is a completely different variable than the previously described grocery_list variable that is outside of the method.
# What concepts were solidified in this challenge, and what concepts are still confusing?
  # I learned the simpler way to push items into a hash by using the keyed index rather than the built in methods I have used before (i.e. .store)
  # This challenge was fairly easy for me to complete, and it was great to be able to use my guide as my pair so it was like a one-on-one office hours. All the concepts used in this challenge are clear to me.
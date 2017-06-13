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
  p list
end

def remove_item(list, item)
  list.delete(item)
  p list
end

def update_quantity(list, item, quantity)
  list[item] = quantity
  p list
end

# Method to print a list and make it look pretty
# input: list
# steps:
  # print each item and quanitity from the hash
# output: pretty list

def print_list(list)
  p list
end

grocery_list = create_list("apples oranges bananas salmon")

add_item(grocery_list, "cheese", 5)

remove_item(grocery_list, "apples")

update_quantity(grocery_list, "cheese", 2)

print_list(grocery_list)
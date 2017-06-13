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
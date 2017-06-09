# PSUEDOCODE:

# define array
# create a method that searches the array for a value and returns the index it is located or nil
# input: array, integer
# steps:
  # index = 0
  # WHILE index < arr.length DO
    # IF value is equal to the target value
      # RETURN the index
    # END if statement
    # index += 1
  # END each loop
# END method
# output: index

arr = [42, 89, 23, 1]
def search_array(arr, i)
  index = 0
  while index < arr.length do
    if i == arr[index]
      return index
    end
    index += 1
  end
end

p search_array(arr, 1)
p search_array(arr, 24)
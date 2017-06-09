# RELEASE 0 - Implement a Simple Search:

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

# RELEASE 1 - Calculate Fibonacci Numbers

# method 1:

def fib(x)
  fib_nums = [0,1]
  number = x - 2
  number.times do
    fib_nums << fib_nums[-2] + fib_nums[-1]
  end
  p fib_nums
end

fib(6)
fib(100)

# method 2:

def fibonacci(n)
  index = 0
  fib_array = [0,1]
  until fib_array.length == n
    continued_array = fib_array[index] +fib_array[index + 1]
    fib_array << continued_array
    index += 1
  end
  p fib_array
end

fibonacci(6)

# RELEASE 2 - Sort an Array:

# define an array of integers
# create a method that takes the array as the argument and returns a sorted version of that array
# input: array
# steps:
  # define a variable that equals the LENGTH of the array
  # define a boolean variable for swapped status
  # create a loop to keep repeating WHILE swapped status equals true
    # change swapped status to false
    # create a loop for x amount of times and x is the length of the array - 1 (this - 1 is here because arrays are zero-indexed)
      # IF the value of one index is greater than the value of the next index:
        # switch the value of that index with the value of the next index
        # change swapped status to true
      # END - ending if statement
    # END - ending .times loop
  # END - ending until loop
# END - ending method

# output: array


array = [2,5,1,9,3,6]

def bubble_sort(array)
  x = array.length
  swapped = true
  while swapped do
    swapped = false
    (x-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
  end
  array
end

p bubble_sort(array)

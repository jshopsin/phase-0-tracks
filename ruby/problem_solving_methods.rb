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
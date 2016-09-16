# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

# Test Cases
  sum_to(5)  # => returns 15
  sum_to(1)  # => returns 1
  sum_to(9)  # => returns 45
  sum_to(-8)  # => returns nil


# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array = [])
  return nums_array[0] if nums_array.size <= 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Test Cases
add_numbers([1,2,3,4]) # => returns 10
add_numbers([3]) # => returns 3
add_numbers([-80,34,7]) # => returns -39
add_numbers() # => returns nil


# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n-1) * gamma_fnc(n-1)
end

# Test Cases
gamma_fnc(0)  # => returns nil
gamma_fnc(1)  # => returns 1
gamma_fnc(4)  # => returns 6
gamma_fnc(8)  # => returns 5040

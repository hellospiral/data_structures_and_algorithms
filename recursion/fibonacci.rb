# Implement a Fibonnaci Sequence in three different ways:

# Recursively
# Dynamically (Using Memoization to store results)
# Iteratively

# Your function will accept a number n and return the nth number of the fibonacci sequence

def fib_rec(number)
  # Base Case
  if number == 1 || number == 0
    return number
  else
    # Recursion
    return fib_rec(number-1) + fib_rec(number-2)
  end
end

def fib_memo(number)
  memo = {}

  # Base Case
  if number == 1 || number == 0
    return number

  # Check cache
  elsif memo.keys.include?(number)
    return memo[number]

  # Keep setting cache
  else
    memo[number] = fib_memo(number-1) + fib_memo(number-2)
  end
end

def fib_iter(number)
  # set starting points
  a,b = 0,1

  # set a = b and b = a + b
  number.times do
    a, b = b, a + b
  end

  return a
end

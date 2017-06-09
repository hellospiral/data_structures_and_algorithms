# Reverse a string using recursion

def reverse(string)

  # Base case
  if string.length == 1
    return string
  end

  # Recursive case:
  return reverse(string[1..-1]) + string[0]
end

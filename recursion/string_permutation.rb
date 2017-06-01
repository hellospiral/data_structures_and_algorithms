# Given a string, write a function that uses recursion to output a list of all the possible permutations of that string.

# For example, given s='abc' the function should return ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']

# Note: If a character is repeated, treat each occurence as distinct, for example an input of 'xxx' would return a list with 6 "versions" of 'xxx'

def permutations(string)
  output = []

  return [string] if string.size == 1

  # 1. Iterate through the initial string
  string.each_char.with_index do |letter, idx|

    # 2. For each character in the initial string, set aside that character and get a list of all permutations of the string that’s left.
    left = string[0...idx]
    right = string[(idx + 1..-1)]
    perm_string = left + right
    single_permutation = permutations(perm_string)

    # 3. Once you have the list form step 2, add each element from that list to the character from the initial string, and append the result to our list of final results.
    single_permutation.each do |perm_letter|

      output << letter + perm_letter
    end
  end

  # 4. Return the list of final results
  return output
end

permutations('abc')
# => ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']

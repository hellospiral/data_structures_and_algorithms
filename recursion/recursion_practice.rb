# Write a recursive function which takes an integer and computes the cumulative sum of 0 to that integer
#
# For example, if n=4 , return 4+3+2+1+0, which is 10.
def rec_sum(n)
  if n == 0
    return 0
  else
    return n + rec_sum(n-1)
  end
end

# Given an integer, create a function which returns the sum of all the individual digits in that integer. For example: if n = 4321, return 4+3+2+1
def sum_func(n)
  if n / 10 == 0
    return n
  else
    return n % 10 + sum_func(n/10)
  end
end

# Create a function called word_split() which takes in a string phrase and a set list_of_words. The function will then determine if it is possible to split the string in a way in which words can be made from the list of words. You can assume the phrase will only contain words found in the dictionary if it is completely splittable.

# for example: word_split('themanran',['the','ran','man']) => ['the', 'man', 'ran']
# word_split('ilovedogsJohn',['i','am','a','dogs','lover','love','John']) => ['i', 'love', 'dogs', 'John']
# word_split('themanran',['clown','ran','man']) => []

def word_split(phrase, list, output = nil)

  # Checks to see if any output has been initiated. necessary to avoid infinite recursion
  if output == nil
    output = []
  end

  list.each do |word|
    # If the current phrase begins with the word, we have a split point
    if phrase.start_with?(word)
      # Add the word to the output
      output.push(word)
      # Recursively call split function on the remaining portion of the phrase, passing along list and output.
      return word_split(phrase[word.length..-1], list, output)
    end
  end
  # Finally return output if no phrase.start_with?(word); returns true
  return output
end

word_split('themanran',['the','ran','man'])
word_split('ilovedogsJohn',['i','am','a','dogs','lover','love','John'])

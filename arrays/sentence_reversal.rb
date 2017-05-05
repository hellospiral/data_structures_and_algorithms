def rev_words_one(string)

  # 1. trim all whitespace before and after
  string.strip!()

  # 2. split string into an array of words
  string_array = string.split(' ')

  # 3. create a new empty array
  new_arr = []

  # 4. loop through string array and push each word to the front of new array
  string_array.each do |string|
    new_arr.unshift(string)
  end

  # 5. return joined new_array
  return new_arr.join(' ')

end

def rev_words(string)

  # 1. strip string
  string.strip!()

  # 2. set empty array and index counter
  words = []
  i = 0

  # 3. loop through the string with the index
  while i < string.length() do

    # 4. set variable for the index of where the word starts
    if string[i] != ' '
      word_start = i

      # 5. start new loop, iterating index until it finds a space
      while i < string.length() && string[i] != ' ' do
        i += 1
      end

      # 6. slice the string from word_start to the new i and push it to front of the array
      words.unshift(string[word_start..i-1])
    end

    i += 1
  end

  # 7. return the joined array
  return words.join(' ')
end

rev_words('Hi John,   are you ready to go?')
rev_words('    space before')

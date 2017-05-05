def uni_chars(string)

  # edge cases? empty string
  if string.length == 0
    return true
  end

  # declare an empty hash
  dict = {}

  # iterate over the split string and for each letter, add one to the value of the hash for that letter
  string.split('').each do |letter|
    # check the hash already has a key for this letter, increment the value by 1
    if dict[letter]
      dict[letter] += 1
      # if any values in the hash reach 2, return false
      if dict[letter] > 1
        return false
      end
    # if the hash doesn't have a key for this letter, set it to 1
    else
      dict[letter] = 1
    end
  end

  # otherwise return true at the end of the loop
  return true
end

# one line solution using set

def unique_chars_2(string)

  if Set.new(string.split('')).length == string.length
    return true
  else
    return false
  end
end

# another solution using a set
require 'set'
def unique_chars_3(string)

  # 1. Declare an empty set for the letters
  set = Set.new

  # 2. Loop over string
  string.split('').each do |letter|
    # 3. If the letter is already in the set return false
    if set.include?(letter)
      return false
    # 4. Else add it to the set
    else
      set.add(letter)
    end
  end

  # 5. If loop completes return true
  return true
end

string = 'abcde'

# Problem: Given a string in the form 'AAAABBBBCCCCCDDEEEE' compress it to become 'A4B4C5D2E4'. Function should be case sensitive, so that a string 'AAAaaa' returns A3a3

def compress(string)

  # 0. Edge case check for empty strings and strings with length 1
  if string.length == 0
    return ''
  elsif string.length == 1
    return string + '1'
  end

  # 1. set variables: current_letter, counter, and output_string
  current_letter = string[0]
  counter = 0
  output_string = current_letter

  # 2. loop over the string and increment the counter on matches
  string.split('').each do |letter|
    if letter == current_letter
      counter += 1
    else
      # 3. when the letter changes, append the counter and the new letter to the output_string, reset the current_letter and counter
      output_string + counter.to_s
      output_string + letter
      current_letter = letter
      counter = 1
    end
  end

  # 4. append the final counter after the loop and return the output_string
  output_string + counter.to_s
  return output_string
end

def balance_check(string)

  # 1. Check for even number of characters
  if string.length % 2 != 0
    return false
  end

  # 2. Hash for matching pairs
  matches = { '{' => '}', '(' => ')', '[' => ']'}

  # 3. Use an array as a "Stack"
  stack = []

  # 4. Check every parentheses in string
  string.split('').each do |paren|

    # 5. If it's an opening, push it to the stack
    if matches.keys.include?(paren)
      stack.push(paren)

    else
      # 6. If it's not an opening, make sure there are open parentheses in the stack
      if stack.length == 0
        return false
      end

      # 7. Pop the last open parenthesis off the stack, and check that its match is the current character
      last_open = stack.pop
      if matches[last_open] != paren
        return false
      end
    end
  end
  # 8. Return true if there are no more open parens left in the stack
  return stack.length == 0
end

balance_check('[]')
balance_check('[](){([[[]]])}')
balance_check('()(){]}')

# Given a target amount n and a list (array) of distinct coin values, what's the fewest coins needed to make the change amount.
#
# For example:
#
# If n = 10 and coins = [1,5,10]. Then there are 4 possible ways to make change:
#
# 1+1+1+1+1+1+1+1+1+1
#
# 5 + 1+1+1+1+1
#
# 5+5
#
# 10
#
# With 1 coin being the minimum amount.

def rec_coin(target, coins, hash = {})
  biggest_coin = coins.delete(coins.max)
  min_coins = 0

  hash[biggest_coin] = target / biggest_coin

  # Recursive case only runs when there is a remainder
  if target % biggest_coin > 0
    remainder = target % biggest_coin
    rec_coin(remainder, coins, hash)
  end

  # Add up the values in the hash
  hash.values.each do |val|
    min_coins += val
  end

  # make sure greedy solution is optimal
  hash.keys.each do |coin|
    if target % coin == 0 && target / coin < min_coins
      return target / coin
    end
  end

  return min_coins
end

rec_coin(10,[1,5])
# => 2
rec_coin(45, [1,5,10,25])
# => 3
rec_coin(23, [1,5,10,25])
# => 5
rec_coin(74, [1,5,10,25])
# => 8
rec_coin(6, [1,3,4])
# => 2
rec_coin(63, [1,5,10,21,25])
# => 3

# O(1) Constant
def func(values)
  puts values[0]
end

# O(n) Linear
def func(list)
  list.each do |element|
    puts element
  end
end

# O(n^2) Quadratic
def func(list)
  list.each do |element_1|
    list.each do |element_2|
      puts element_1.to_s + ', ' + element_2.to_s
    end
  end
end

# O(n) Linear (expected case)
def func(list, match)
  list.each do |item|
    if item == match
      return true
    end
  end

  return false
end

# O(1 + (n/2) + 10) reduces to O(n) as n grows arbitrarily large
def func(list)

  puts list[0]

  midpoint = list.length / 2

  array[0..midpoint-1].each do |element|
    puts element
  end

  10.times do
    puts 'hello world'
  end
end


def func(number)
  number.times do # O(n) time complexity
    puts 'hello world' # O(1) space complexity
  end
end

# O(n^2) Quadratic
def func(number)
  number.times do
    number.times do
      puts 'hello world'
    end
  end
end

# O(log(n)) Logarithmic
def func(number)
  counter = 0
  while number > 0 do
    counter += 1
    number /= 2
  end
  return counter
end

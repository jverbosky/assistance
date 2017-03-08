# Pseudo-code pattern
# 1) Define function & arguments (parameters)
# 2) Define placeholder (bucket) variables
# 3) Use a loop to iterate through the array
# 4) Inside the loop, create conditions to test (if/elsif/else)
# 5) While testing conditions, change the value of (or add things to) the placeholder(s)
# 6) After looping (iterating) through the array, test the placeholder value(s) - return true/false

def function(number, array)

  placeholder = 0
  anti-placeholder = 0
  placeholder_array = []
  anti-placeholder_array = []

  loop through the array
    check conditions (if)
       placeholder += 1
       placeholder_array.push("parameter_2")
    # else
    #    anti-placeholder += 1
    #    anti-placeholder_array = []
    end
  end

  if placeholder > 0
    return true
  else
    return false
  end

end
_________________________________

# Example of string interpolation to see variable values

puts "num: #{num}"
print "lotery: #{lotery}"
print "\n"
_________________________________

# Return true if number (num) is in the array (lotery), false if it isn't

def win_number(num,lotery)

  winner = 0
  loser = 0
  count = 1

  lotery.each do |value|
    if num == value
      winner += 1
      puts "Iteration #{count}"
      puts "num: #{num}"
      puts "value: #{value}"
      puts "winner: #{winner}"
      puts "\n"
      count += 1
    else
      loser += 1
      puts "Iteration #{count}"
      puts "num: #{num}"
      puts "value: #{value}"
      puts "loser: #{loser}"
      puts "\n"
      count += 1
    end
  end
end

print win_number(3, [1,2,3,4,5,6])  # explanatory_output_1.txt
# print win_number(10, [1, 2, 8, 10, 20, 41, 32, 43, 30, 19])  # explanatory_output_2.txt
# puts win_number(3, [1, 2, 8, 10, 20])
_________________________________

def win_number(num,lotery)

  #For each number in the array verify if is the number
  winner = 0
  #loser = 0

  lotery.each do |value|
    if num == value
      winner += 1
    # else
    #   loser += 1
    end
  end

  if winner > 0
    return true
  else
    return false
  end

end

puts win_number(3, [1,2,3,4,5,6])
puts win_number(10, [1, 2, 8, 10, 20])
puts win_number(3, [1, 2, 8, 10, 20])
_________________________________

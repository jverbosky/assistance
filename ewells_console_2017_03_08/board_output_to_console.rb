board = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]

# rows = board.each_slice(3).to_a

slices = board.each_slice(3).to_a

# p slices  # [["X", "O", "X"], ["O", "X", "O"], ["X", "O", "X"]]

# puts slices[0].join(" ")

# test_array = ["c", "a", "t"]

# puts test_array.join(" ")

slices.each do |slice|
  puts " " + slice.join(" ")
end

# p board
# print board
# puts board

# print slices[0]
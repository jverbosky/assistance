require_relative "board.rb"  # need this statement to access the @board object in the Board class (board.rb)

# Pat's game board

class Game

  def initialize
    # @board = (1..9).to_a  # commented out, as we want to use Board.new instance (layout) to access @board
    @running = true
  end

  def display_game_board(board)  # need to add an argument to access the Board.new instance of board
    puts "\n -----------"
    board.each_slice(3) do |row|   # change @board > board
      print '  '
      puts row.join(' | ')
      puts ' -----------'
    end
    puts
  end

  def determine_player(player)
    if player == :X
      return :X.to_s
    elsif player == :O
      return :O.to_s
    end
  end

  def turn(chosen_player, board)  # need to add an argument to access the Board.new instance of board
    display_game_board(board)  # need to add board argument when calling display_game_board
    puts "Player #{chosen_player} choose a square (1-9) to place your marker on."
    position = gets.chomp.to_i

    if board.include?(position)   # change @board > board, since we're no longer using the instance variable
      board.map! do |num|   # change @board > board, since we're no longer using the instance variable
        if num == position
          determine_player(chosen_player)
        else
          num
        end
      end
    elsif position.is_a?(String)
      if position.downcase == 'exit'
        puts 'Goodbye.'
        exit
      end
      puts 'Enter a number please.'
      puts 'Try again or type EXIT to quit.'
      turn(chosen_player, board)  # need to add board argument when calling turn
    else
      puts 'Cannot use this position,'
      puts 'Try again or type EXIT to quit.'
      turn(chosen_player, board)  # need to add board argument when calling turn
    end
  end

  def result?(board)  # need to add an argument to access the Board.new instance of board
  # determine if won, draw, lost
      display_game_board(board)  # need to add board argument when calling display_game_board
      @running = true
  end

# winning sequences
# [0, 1, 2], [3, 4, 5], [6, 7, 8]
# [0, 3, 6], [1, 4, 7], [2, 5, 8]
# [0, 4, 8], [2, 4, 6]

  def play_against_human(board)  # need to add an argument to access the Board.new instance of board
    while @running
      turn(:X, board)  # need to add board argument when calling turn
      result?(board)  # need to add board argument when calling board
      break if !@running
      turn(:O, board)  # need to add board argument when calling turn
      result?(board)  # need to add board argument when calling board
    end
  end

end

def play_game

  match = Game.new
  layout = Board.new  # You need to create a new instance of Board class to access it's objects (i.e. @board)
                      # We could say "board = Board.new" here, but I didn't so that line 93 is easier to understand.

  puts 'Tic Tac Toe Awaits'
  puts 'Enter 1 to play a human, 2 to random play, 3 to play against a computer.'
  puts 'Type EXIT to quit.'

  choice = gets.chomp.to_i
  case choice
    when 1 then match.play_against_human(layout.board)   # This is where we access the @board object from the
                                                         # Board class "layout" instance that we created on line 84.
                                                         # From this point on, we need to pass this object into our
                                                         # methods so that their statements can access the object.
                                                         # The way we do this is by adding an argument to each method
                                                         # that has statements that use the object.
    when 2 then puts 'Entered 2.'
    when 3 then puts 'Entered 3.'
    else        puts 'Enter 1-3 only.'
  end

end

play_game
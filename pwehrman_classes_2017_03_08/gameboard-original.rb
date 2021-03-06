# Pat's game board

class Game
  
  def initialize
    @board = (1..9).to_a
    @running = true
  end

  def display_game_board
    puts "\n -----------"
    @board.each_slice(3) do |row|
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

  def turn(chosen_player)
    display_game_board
    puts "Player #{chosen_player} choose a square (1-9) to place your marker on."
    position = gets.chomp.to_i

    if @board.include?(position)
      @board.map! do |num|
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
      turn(chosen_player)
    else
      puts 'Cannot use this position,'
      puts 'Try again or type EXIT to quit.'
      turn(chosen_player)
    end
  end

  def result?
  # determine if won, draw, lost
      display_game_board
      @running = true
  end

# winning sequences
# [0, 1, 2], [3, 4, 5], [6, 7, 8]
# [0, 3, 6], [1, 4, 7], [2, 5, 8]
# [0, 4, 8], [2, 4, 6]

  def play_against_human
    while @running
      turn(:X)
      result?
      break if !@running
      turn(:O)
      result?
    end
  end

end

def play_game

  match = Game.new

  puts 'Tic Tac Toe Awaits'
  puts 'Enter 1 to play a human, 2 to random play, 3 to play against a computer.'
  puts 'Type EXIT to quit.'

  choice = gets.chomp.to_i
  case choice
    when 1 then match.play_against_human
    when 2 then puts 'Entered 2.'
    when 3 then puts 'Entered 3.'
    else        puts 'Enter 1-3 only.'
  end

end

play_game
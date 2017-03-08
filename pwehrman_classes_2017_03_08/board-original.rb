class Board

  # allow read and write
  attr_accessor :board

  
  def initialize
    @board = (1..9).to_a
  end

end
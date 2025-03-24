# frozen_string_literal: true

# Contains methods defining the valid moves per piece.

module PieceMoves
  def valid_knight_moves(x, y)
    moves = generate_knight_moves(x, y)
    filter_valid_moves(moves)
  end
  
  private
  
  def generate_knight_moves(x, y)
    [
      [x + 1, y + 2], [x + 2, y + 1], [x + 2, y - 1], [x + 1, y - 2],
      [x - 1, y - 2], [x - 2, y - 1], [x - 2, y + 1], [x - 1, y + 2]
    ]
  end
  
  def filter_valid_moves(moves)
    moves.select { |new_move_x, new_move_y| valid_coordinates?(new_move_x, new_move_y) }
  end
  
  def valid_coordinates?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end
end

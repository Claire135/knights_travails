require_relative 'lib/chess_board'
require_relative 'lib/knight'

chessboard = ChessBoard.new
knight = Knight.new(chessboard)

knight.knight_moves([0, 1], [5, 6])
knight.knight_moves([0, 0], [3, 3])
knight.knight_moves([2, 2], [5, 5])
knight.knight_moves([0, 0], [7, 7])
knight.knight_moves([0, 7], [7, 0])
knight.knight_moves([4, 4], [7, 7])
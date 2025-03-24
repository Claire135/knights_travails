require_relative 'node'
require_relative 'piece_moves'
require_relative 'displayable'

class ChessBoard
    include PieceMoves
    include Displayable

    def initialize
        @board = generate_board
    end

    def generate_board
        board = []
        8.times do |x_axis|
            row = []
            8.times do |y_axis|
                row << Node.new(x_axis, y_axis)
            end
        board << row
        end
        board
    end

end

new = ChessBoard.new
new.print_board


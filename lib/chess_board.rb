require_relative 'node'
require_relative 'piece_moves'
require_relative 'displayable'

class ChessBoard
    include PieceMoves
    include Displayable

    def initialize
        @board = generate_board
        connect_nodes
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

    def connect_nodes(piece, piece_moves_method)
        @board.each do |row|
            row.each do |node|
                valid_knight_moves(node.x_axis, node.y_axis).each do |new_move_x, new_move_y|
                    node.connections << @board[new_move_x][new_move_y]
                end
            end
        end
    end

end

chessboard = ChessBoard.new
chessboard.print_node_connections


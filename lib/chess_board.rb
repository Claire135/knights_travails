# generates and stores the board using nodes with coordinates from 0-7
# provides node connections on the board so that pieces can move in relation.

# frozen_string_literal: true

require_relative 'node'
require_relative 'piece_moves'
require_relative 'displayable'

class ChessBoard
  attr_accessor :board
  
  include PieceMoves
  include Displayable

  def initialize
    @board = generate_board
    connect_nodes(method(:valid_knight_moves))
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

  def connect_nodes(piece_moves_method)
    @board.each do |row|
      row.each do |node|
        valid_moves = piece_moves_method.call(node.x_axis, node.y_axis)
        valid_moves.each do |new_move_x, new_move_y|
          node.connections << @board[new_move_x][new_move_y]
        end
      end
    end
  end
end
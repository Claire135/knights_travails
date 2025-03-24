require_relative 'breadth_first_search'
require_relative 'chess_board'

class Knight
  include BreadthFirstSearch

  def initialize(chessboard)
    @board = chessboard.board 
    @path = nil
  end

  def knight_moves(start_coordinates, end_coordinates)
    find_shortest_path(start_coordinates, end_coordinates)
    
    if @path
      puts "You made it in #{no_of_moves} moves! Here's your path:"
      output_moves
    else
      puts "No path found."
    end
  end

  private

  def output_moves
    @path.each { |node| puts "(#{node.x_axis}, #{node.y_axis})" }
  end

  def find_shortest_path(start_coordinates, end_coordinates)
    start_node = @board[start_coordinates[0]][start_coordinates[1]]
    end_node = @board[end_coordinates[0]][end_coordinates[1]]

    @path = bfs(start_node, end_node)
  end

  def no_of_moves
    @path ? @path.length-1 : 0
  end
end
module Displayable
    def print_board
        @board.each do |row|
            row.each { |node| print "#{node}" }
        end
    end
end
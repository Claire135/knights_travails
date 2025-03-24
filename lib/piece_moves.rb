module PieceMoves
    def valid_knight_moves(x, y)
        moves = [
            [x+1, y+2], [x+2, y+1], [x+2, y-1], [x+2, y-2], 
            [x-1, y-2], [x-2, y-1], [x-2, y+], [x-1, y+2]
        ]

    end
end
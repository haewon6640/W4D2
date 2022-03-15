class Board
    
    def initialize
        @board = Array.new(8) {Array.new(8)}
    end

    def [](pos) # [2,3]
        row,col = pos
        @board[row][col]
    end

    def []=(pos,val)
        row,col = pos
        @board[row][col] = val
    end
    # [7,0] [6,0]
    def move_piece(start_pos,end_pos)
        raise "No piece" if @board[start_pos].is_a?(NullPiece)
        raise "Piece cannot move to #{end_pos}" unless @board[end_pos].is_a?(NullPiece)
        piece = @board[start_pos]
        @board[end_pos] = piece
        @board[start_pos] = NullPiece.new()
    end
end
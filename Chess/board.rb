require_relative "piece"
class Board
    
    def initialize
        @board = Array.new(8) {Array.new(8)}
        set_pieces
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
        raise "No piece" if self[start_pos].is_a?(NullPiece)
        raise "Piece cannot move to #{end_pos}" unless self[end_pos].is_a?(NullPiece)
        piece = self[start_pos]
        self[end_pos] = piece
        self[start_pos] = NullPiece.new()
    end
    private
    attr_accessor :board
    def set_pieces 
        board[0][0] = Piece.new("Rook", 1)
        board[0][7] = Piece.new("Rook", 1)
        board[0][1] = Piece.new("Knight", 1)
        board[0][6] = Piece.new("Knight", 1)
        board[0][2] = Piece.new("Bishop", 1)
        board[0][5] = Piece.new("Bishop", 1)
        board[0][3] = Piece.new("Queen", 1)
        board[0][4] = Piece.new("King", 1)
        (0..7).each do |j|
            board[1][j] = Piece.new("Pawn", 1)    
        end

        board[7][0] = Piece.new("Rook")
        board[7][7] = Piece.new("Rook")
        board[7][1] = Piece.new("Knight")
        board[7][6] = Piece.new("Knight")
        board[7][2] = Piece.new("Bishop")
        board[7][5] = Piece.new("Bishop")
        board[7][3] = Piece.new("King")
        board[7][4] = Piece.new("Queen")
        (0..7).each do |j|
            board[6][j] = Piece.new("Pawn")    
        end

        (2..5).each do |i|
            (0..7).each do |j|
                board[i][j] = NullPiece.new
            end
        end

    end
end
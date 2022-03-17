require_relative "piece"
class Board
    
    def initialize
        @board = Array.new(8) {Array.new(8)}
        set_pieces
    end

    def [](pos) # [2,3]
        row,col = pos
        if @board[row] == nil
            return nil
        end
        @board[row][col]
    end

    def []=(pos,val)
        row,col = pos
        @board[row][col] = val
    end
    # [7,0] [6,0]
    def move_piece(start_pos,end_pos)
        # By calling piece.moves, we have access to all the valid moves
        piece = self[start_pos]
        raise "No piece" if piece.is_a?(NullPiece)
        raise "Piece cannot move to #{end_pos}" unless piece.moves.include?(end_pos)
        piece.pos = end_pos
        self[end_pos] = piece
        self[start_pos] = NullPiece.instance
    end

    def print 
        result = ""
        board.each do |row|
            rowStr = ""
            row.each do |piece|
                rowStr << piece.symbol
            end
            result << rowStr + "\n"
        end
        puts result
        return nil
    end

    private
    attr_accessor :board
    def set_pieces
        [:black,:white].each do |color|
            (0..3).each do |col|
                row = color == :black ? 0 : 7
                pawn_row = color == :black ? 1 : 6
                if col == 0
                    self[[row,col]] = Rook.new([row,col],self,color)
                    self[[row,7-col]] = Rook.new([row,7-col],self,color)
                elsif col == 1
                    self[[row,col]] = Knight.new([row,col],self,color)
                    self[[row,7-col]] = Knight.new([row,7-col],self,color)
                elsif col == 2
                    self[[row,col]] = Bishop.new([row,col],self,color)
                    self[[row,7-col]] = Bishop.new([row,7-col],self,color)
                else
                    (0..7).each do |j|
                        self[[pawn_row,j]] = Pawn.new([pawn_row,j],self,color)
                    end
                end
            end
        end

        self[[0,3]] = Queen.new([0,3],self, :black)
        self[[0,4]] = King.new([0,4],self, :black)
        self[[7,3]] = Queen.new([7,3],self, :white)
        self[[7,4]] = King.new([7,4],self, :white)

        (2..5).each do |i|
            (0..7).each do |j|
                self[[i,j]] = NullPiece.instance
            end
        end

    end

    # Check Empty and Valid position
    def empty?(position)
        return true if board[position].is_a?(NullPiece)
        false
    end

    def valid_range?(pos)
        return true if pos[0] >= 0 && pos[1] >= 0 && pos[0] < 8 && pos[1] < 8
        false
    end

    def valid_move?(pos)
        valid_range?(pos) && empty?(pos)
    end
end



b = Board.new
b.print
b.move_piece([6,1],[4,1])
b.print
b.move_piece([7,2],[5,0])
b.print
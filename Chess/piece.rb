class Piece
    
    def initialize(piece_name, color = "white")
        @value = piece_name
        @color = color == "white" ?  color :  "black"
    end

end

class NullPiece

    def initialize
        @value = nil
    end

end
require_relative 'modules'

class Piece
    attr_reader :color, :pos, :board
    def initialize(curr_position, board, color = "white")
        @board = board
        @pos = curr_position
        @color = color == "white" ?  color :  "black"
    end

    def Symbol
        symbol
    end

    private
    def move_into_check?(end_pos)
    end
end

class NullPiece
    def initialize
        @value = nil
    end
end

class Rook < Piece

    # include Slideable
    def symbol
        "R"
    end
    
    private
    def move_dirs

    end
    # def initialize(position,color)
    #     super
    # end
end
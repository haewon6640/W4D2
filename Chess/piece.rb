require_relative 'modules'

class Piece
    attr_reader :color, :pos, :board
    def initialize(curr_position, board, color = "white")
        @board = board
        @pos = curr_position
        @color = color == "white" ?  color :  "black"
    end

    def Symbol
        raise NotImplementedError
    end

    def to_s
        return '#{Symbol}'
    end

    def empty?
        board[pos].empty?
    end

    def valid_moves

    end

    private
    def move_into_check?(end_pos)
    end
end

class NullPiece < Piece
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
        horizontal_dirs + vertical_dirs
    end

end

class Bishop < Piece
    def symbol
        "B"
    end

    private
    def move_dirs
        diagonal_dirs
    end

end

class Queen < Piece
    def symbol
        "Q"
    end

    private
    def move_dirs
        diagonal_dirs + horizontal_dirs + vertical_dirs
    end

end


class Knight < Piece
    def symbol
        "N"
    end

    private
    def move_diffs
        [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [-2,1], [-2.-1], [-2,-1]]
    end
end


class King < Piece
    def symbol
        "K"
    end

    private
    def move_diffs
        [[0,1],[0,-1], [1,0], [-1,0], [1,1], [-1,1], [1,-1],[-1,1]]
    end
end

class Pawn < Piece
    def symbol
        "P"
    end

    def moves
        poss_moves = []
        if at_start_row
            poss_moves << pos + forward_steps + forward_steps

        [1,0]
    end

    private
    def at_start_row?
        if pos[0] == 1 && color == "black"
            return true
        elsif pos[0] == 6 && color == "white"
            return true
        else
            false
        end
    end

    def forward_dir
        return color == "white" ? -1 : 1
    end

    def forward_steps
        forward_dir * [1,0]
    end

    def side_attacks

    end

end


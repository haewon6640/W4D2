require 'singleton'
require_relative 'slideable'
require_relative 'stepable'
require 'colorize'

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    def initialize(curr_position, board, color = :white)
        @board = board
        @pos = curr_position
        @color = color
        @printColor = color == :black ? :red : :blue
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
    include Singleton
    def initialize
        
    end

    def color
        "Nil"
    end

    def symbol 
        " _ "
    end

    def moves
    end

end

class Rook < Piece

    include Slideable
    def symbol
        " R ".colorize( @printColor)
    end
    
    private
    def move_dirs
        horizontal_dirs
    end

end

class Bishop < Piece
    include Slideable
    def symbol
        " B ".colorize( @printColor)
    end

    private
    def move_dirs
        diagonal_dirs
    end

end

class Queen < Piece
    include Slideable
    def symbol
        " Q ".colorize( @printColor)
    end

    private
    def move_dirs
        dirs = diagonal_dirs + horizontal_dirs
        dirs
    end

end


class Knight < Piece
    include Stepable
    def symbol
        " N ".colorize( @printColor)
    end

    private
    def move_diffs
        [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]
    end
end


class King < Piece
    include Stepable

    def symbol
        " K ".colorize( @printColor)
    end

    private
    def move_diffs
        [[0,1],[0,-1], [1,0], [-1,0], [1,1], [-1,1], [1,-1],[-1,1]]
    end
end

class Pawn < Piece
    def symbol
        " P ".colorize( @printColor)
    end

    def moves
        poss_moves = []

        poss_moves << [pos[0]+forward_steps[0],pos[1]+forward_steps[1]]
        if at_start_row?
            poss_moves << [pos[0]+2*forward_steps[0],pos[1]+2*forward_steps[1]]
        end
        poss_moves.reject! do |move| 
            !board[move].is_a?(NullPiece)
        end
        poss_moves += side_attacks
    end

    private
    def at_start_row?
        if pos[0] == 1 && color == :black
            return true
        elsif pos[0] == 6 && color == :white
            return true
        else
            false
        end
    end

    def forward_dir
        return color == :white ? -1 : 1
    end

    def forward_steps
        [forward_dir*1,0]
    end

    def side_attacks

        attack_moves = []
        delta = [[forward_dir*1,forward_dir*1],[forward_dir*1,forward_dir*-1]]
        if board[[pos[0] + delta[0][0],pos[1] + delta[0][1]]].color != color
            attack_moves << [pos[0] + delta[0][0],pos[1] + delta[0][1]]
        elsif board[[pos[0] + delta[1][0],pos[1] + delta[1][1]]].color != color
            attack_moves << [pos[0] + delta[1][0],pos[1] + delta[1][1]]
        end
        attack_moves
    end

end


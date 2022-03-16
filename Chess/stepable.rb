module Stepable
    def moves
        poss_moves = []
        move_diffs.each do |step|
            poss_moves << step if board[step] == NullPiece || board[step].color != color
        end
        poss_moves
    end

    private
    def move_diffs
        raise NotImplementedError
    end
end
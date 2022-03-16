module Stepable
    def moves
        poss_moves = []
        move_diffs.each do |step|
            # step = [2,-1], [0,-1]
            position = [ pos[0]+step[0] , pos[1]+step[1]  ]
            poss_moves << position if board[position] == NullPiece || board[position].color != color
        end
        poss_moves
    end

    private
    def move_diffs
        raise NotImplementedError
    end
end
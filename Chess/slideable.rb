module Slideable

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        result = []
        move_dirs.each do |dir|
            result += grow_unblocked_moves_in_dir(dir[0], dir[1])
        end
        result
    end

    private
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]].freeze   
    DIAGONAL_DIRS = [[1,1],[-1,1],[1,-1],[-1,1]].freeze 

    def move_dirs()
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        poss_moves = []
        # 1,0 -1,0 0,1 0,-1
        # [3,3]
        multiplier = 1
        constant_deltaX = dx 
        constant_deltaY = dy
        # we make another while loop until we find an enemy
        # make another array of only the enemy ones
        while board.valid_move?([pos[0]+dx,pos[1]+dy])
            poss_moves << [pos[0]+dx,pos[1]+dy]
            multiplier +=1
            dx = constant_deltaX*multiplier
            dy = constant_deltaY*multiplier
        end
        if board.valid_range?([pos[0]+dx,pos[1]+dy]) && board[pos[0]+dx, pos[1]+dy].color != color
        # pos + dxdy has to be null or enemy piece
        # it can't be out of bounds





        poss_moves


        # multiplier = 1
        # constant_deltaX = dx 
        # constant_deltaY = dy
        # while (pos[0] + dx >= 0 && pos[1] + dy >= 0 && pos[0] + dy < 8 && pos[1] + dy < 8) && board[[pos[0]+dx,pos[1]+dy]] != nil && (board[[pos[0] + dx,pos[1] + dy]].is_a?(NullPiece) || board[[pos[0] + dx,pos[1] + dy]].color != color)
        #     if (board[[pos[0]+dx,pos[1]+dy]] != nil && board[[pos[0] + dx,pos[1] + dy]].color != color) && board[[pos[0] + dx,pos[1] + dy]].color != "Nil"
        #         poss_moves << [pos[0]+dx,pos[1]+dy]
        #         break
        #     end
        #     poss_moves << [pos[0]+dx,pos[1]+dy]
        #     multiplier +=1
        #     dx = constant_deltaX*multiplier
        #     dy = constant_deltaY*multiplier
        # end
    end
end

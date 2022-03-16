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
            p dir
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
        multliplier = 1
        constant_deltaX = dx 
        constant_deltaY = dy 

        while board[[pos[0] + dx,pos[1] + dy]] == NullPiece || board[[pos[0] + dx,pos[1] + dy]].color != color

            if (board[[pos[0] + dx,pos[1] + dy]].color != color)
                poss_moves << [pos[0]+dx,pos[1]+dy]
                break
            end
            poss_moves << [pos[0]+dx,pos[1]+dy]
            multiplier +=1
            dx = constant_deltaX*multiplier
            dy = constant_deltaY*multiplier
        end
        p poss_moves
        poss_moves

    end
end


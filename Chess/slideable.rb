module Slideable

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def vertical_dirs 
        VERTICAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        result = []
        move_dirs.each {|dir| result += grow_unblocked_moves_in_dir(dir[0], dir[1]) }
        result
    end

    private
    HORIZONTAL_DIRS = [[0,1][0,-1]].freeze   
    VERTICAL_DIRS = [[1,0][-1,0]].freeze
    DIAGONAL_DIRS = [[1,1][-1,1],[1,-1],[-1,1]].freeze 

    def move_dirs()
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        poss_moves = []
        multliplier = 1
        constant_deltaX = dX 
        constant_deltaY = dY 

        while board[pos[0] + dx,pos[1] + dy] == NullPiece \
            || board[pos[0] + dx,pos[1] + dy].color != color

            if (board[pos[0] + dx,pos[1] + dy].color != color)
                poss_moves << [pos[0]+dx,pos[1]+dy]
                break
            end
            poss_moves << [pos[0]+dx,pos[1]+dy]
            multiplier +=1
            dx = constant_deltaX*multiplier
            dy = constant_deltaY*multiplier
        end
        poss_moves

    end
end


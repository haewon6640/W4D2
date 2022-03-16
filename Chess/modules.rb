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
    # [0,1]:right [1,0]:down
    # curr_position = [3,3] dx,dy = [0,1]
    # [1,1] 
    # [3,4],[3,5],[3,6],[3,7] until not out of bounds or blocked
    # poss_moves will have [3,6] if it is the first blocking opposing piece
    # [3,3] white rook, at [3,6] black piece
    # poss moves will ahve [3,6]

    def grow_unblocked_moves_in_dir(dx,dy)
        poss_moves = []
        multliplier = 1
        constant_deltaX = dX # constantX = 0 dX = 0
        constant_deltaY = dY # constantY = 1 dY = 1
        color
        #[3,3]
        # board[3,6] gives us the piece at [3,6]
        while board[curr_position[0] + dx,curr_position[1] + dy] == NullPiece \
            || board[curr_position[0] + dx,curr_position[1] + dy].color != color

            if (board[curr_position[0] + dx,curr_position[1] + dy].color != color)
                poss_moves << [curr_position[0]+dx,curr_position[1]+dy]
                break
            end
            poss_moves << [curr_position[0]+dx,curr_position[1]+dy]
            multiplier +=1
            dx = constant_deltaX*multiplier
            dy = constant_deltaY*multiplier
        end
        poss_moves
    end
end

module Stepable
    def move_dirs
        # goes in a certain number of steps
    end
end
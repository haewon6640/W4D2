module Slideable

    def horizontal_dirs
    end
    
    def diagonal_dirs
    end

    def moves
    end

    private
    HORIZONTAL_DIRS = [[0,1][0,-1]]
    VERTICAL_DIRS = [[1,0][-1,0]]
    DIAGONAL_DIRS = [[1,1][-1,1],[1,-1],[-1,1]]

    def move_dirs()
        # keep going until it is blocked
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        @board
    end
end

module Stepable
    def move_dirs
        # goes in a certain number of steps
    end
end
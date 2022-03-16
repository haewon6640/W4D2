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
        @board
    end
end

module Stepable
    def move_dirs
        # goes in a certain number of steps
    end
end
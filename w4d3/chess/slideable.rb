require "byebug"
module Slideable
     DIAGONAL_DIRS= [
        [1,1],  #[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],
        [1,-1], #[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7],
        [-1,1], #[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7],
        [-1,-1]#, [-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7]
        ]


    HORIZONTAL_DIRS = [
        [1, 0], #[2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
        [-1, 0], #[-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
        [0, 1], #[0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
        [0, -1] #,[0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
      ]


    def diagonal_dir
        DIAGONAL_DIRS
    end

    def horizontal_dir
        HORIZONTAL_DIRS
    end
    #returns array of possible positions on board u can go
    def moves
        moves = []

        move_dirs.each do |dir| #[1,1]
            dx, dy = dir #1 0
            new_pos = grow_unblocked_moves_in_dir(dx, dy) #[1,0][2,0][3,0][4,0],[5,0][6,0][7,0]
            moves += new_pos
        end

        moves
    end
    
    private
    #move dirs tells you what dir the pieces can move in

    #iterate through the directions and increment from position over and over again until no more possible pos
    def grow_unblocked_moves_in_dir(dx, dy)#[1,-1]
        blocked = false
        moves = [pos] #[0,1]-[0,7]
        while !blocked
            # debugger
            blocked = true
            new_pos = [moves.last[0] + dx, moves.last[1] + dy]
            if new_pos.all?{|pos| pos.between?(0,7)}
                if board[new_pos].nil?
                    blocked = false
                    moves << new_pos
                elsif self.color != board[new_pos].color
                    moves << new_pos
                end
            end
        end
        moves[1..-1] 
    end
end

#10/14 MANAGED TO ONLY FINISH BISHOP/KNIGHT/ROOK MOVEMENT
#phase 1 towards the end..

# 0 1 2 3 4 5 6 7
#[R,_,B,Q,_,B,_,R] 0
#[_,_,_,_,_,_,_,_] 1
#[_,_,_,_,_,_,_,_] 2
#[_,_,_,_,_,_,_,_] 3 
#[_,_,_,_,_,_,_,_] 4
#[_,_,_,_,_,_,_,_] 5
#[_,_,_,_,_,_,_,_] 6
#[R,_,B,_,Q,B,_,R] 7
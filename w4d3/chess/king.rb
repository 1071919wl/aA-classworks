require_relative 'piece'

class King < Piece
    include Stepable
    
    def symbol
        if color == 'black'
            puts "♚"
        else
            puts "♔"
        end
    end

    def move_dirs
        movements = [
              [0, 1], [0, -1],
              [1, 0], [-1, 0], 
        ]
    end

end

# 0 1 2 3 4 5 6 7
#[R,_,B,Q,_,B,_,R] 0
#[_,_,_,_,_,_,_,_] 1
#[_,_,_,_,_,_,_,_] 2
#[_,_,_,_,_,_,_,_] 3 
#[_,_,_,_,_,_,_,_] 4
#[_,_,_,_,_,_,_,_] 5
#[_,_,_,_,_,_,_,_] 6
#[R,_,B,_,Q,B,_,R] 7
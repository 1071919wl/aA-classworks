require_relative 'piece.rb'

class Knight < Piece
    include Stepable
    
    def symbol
        if color == 'black'
            puts "♞"
        else
            puts "♘"
        end
    end

    def move_dirs
        movements =[
              [2, 1], [2, -1],
              [1, 2], [1, -2], 
              [-2, 1], [-2, -1],
              [-1, 2], [-1, -2]
        ]
    end

end
require_relative 'piece'

class Pawn < Piece
    include Stepable
    
    def symbol
        if color == 'black'
            puts "♟"
        else
            puts "♙"
        end
    end

    def move_dirs

    end

end
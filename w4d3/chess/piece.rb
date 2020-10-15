# require_relative "board.rb"
# require_relative "slideable"
# require_relative "bishop"
# require_relative "queen"
# require_relative "rook"


class Piece
    attr_reader :color, :board
    attr_accessor :pos

    # include Slideable

    def initialize (color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def valid_moves

    end

    # def move_dirs
    #     moves = diagonal_dir + horizontal_dir
    # end

    def symbol
        
    end

    def empty?

    end

    private

    def move_into_check?(end_pos)
        
    end


end

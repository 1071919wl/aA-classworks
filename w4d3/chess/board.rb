require_relative "./piece.rb"
require_relative "slideable"
require_relative "bishop"
require_relative "queen"
require_relative "rook"


class Board
    attr_accessor :sentinel, :row

    def initialize
        @row = Array.new(8) { Array.new(8, @sentinel) } 
        @sentinel = nil #nullpiece
        populate
    end
    
    def populate
        @row.each_with_index do |subarr, i|
            subarr.each_with_index do |ele, i2|
                if i == 0 
                    if i2 == 0 || i2 == 7
                        subarr[i2] = Rook.new('black', self, [i, i2])
                    # elsif i2 == 1 || i2 == 6
                    #     subarr[i2] = Knight.new('black', self, [i, i2])
                    elsif i2 == 2 || i2 == 5
                        subarr[i2] = Bishop.new('black', self, [i, i2])
                    elsif i2 == 3
                        subarr[i2] = Queen.new('black', self, [i, i2])
                    # elsif i2 == 4
                    #     subarr[i2] = King.new('black', self, [i, i2])
                    end
                # elsif i == 1
                #     subarr[i2] = Pawn.new('black', self, [i, i2])
                # elsif i == 6
                #     subarr[i2] = Pawn.new('white' ,self, [i, i2])
                elsif i == 7
                    if i2 == 0 || i2 == 7
                        subarr[i2] = Rook.new('white', self, [i, i2])
                    # elsif i2 == 1 || i2 == 6
                    #     subarr[i2] = Knight.new('white', self, [i, i2])
                    elsif i2 == 2 || i2 == 5
                        subarr[i2] = Bishop.new('white', self, [i, i2])
                    # elsif i2 == 3
                    #     subarr[i2] = King.new('white', self, [i, i2])
                    elsif i2 == 4
                        subarr[i2] = Queen.new('black', self, [i, i2]) 
                    end   
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        end1, end2 = end_pos
        if self[start_pos] == nil || !(end1.between?(0,7) && end2.between?(0,7))
            # raise Exception
            raise "There are no piece there!"
        else
            self[end_pos] = self[start_pos]
            self[start_pos] = nil
        end
    end

    def [](pos)
        x, y = pos
        @row[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @row[x][y] = value
    end
    
    # def inspect
        
    # end

end#end
# 0 1 2 3 4 5 6 7
#[_,_,_,_,_,_,_,_] 0
#[_,_,_,_,_,_,_,_] 1
#[_,_,_,_,_,_,_,_] 2
#[_,_,_,_,_,_,_,_] 3 
#[_,_,_,_,_,_,_,_] 4
#[_,_,_,_,_,_,_,_] 5
#[_,_,_,_,_,_,_,_] 6
#[_,_,_,_,_,_,_,_] 7
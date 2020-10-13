require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :prev_move_pos
  attr_accessor :next_mover_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children  #self = TicTacToeNode.new(Board.new, :x).children.all?
    arr_children = []

    (0..2).each do |row|
      (0..2).each do |col|
        curr_pos = [row, col]
        if @board.empty?(curr_pos)
          child_board = @board.dup
          child_board[curr_pos] = self.next_mover_mark
          if self.next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end
          arr_children << TicTacToeNode.new(child_board, next_mover_mark, curr_pos)
        end
      end
    end
    return arr_children
  end
end

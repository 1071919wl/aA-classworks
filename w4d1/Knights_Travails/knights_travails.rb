require "byebug"
require_relative "skeleton/lib/00_tree_node"

class KnightPathFinder
    attr_accessor :root_node
    attr_reader :considered_positions, :position

    def initialize(pos) #arr i.e [0, 0]
        @position = pos
        @root_node = PolyTreeNode.new(pos)  
        @considered_positions = [pos]
        build_move_tree
    end

    def self.valid_moves(pos)
        movements = [
            [2, 1], [2, -1],
            [1, 2], [1, -2], 
            [-2, 1], [-2, -1],
             [-1, 2], [-1, -2]
        ]
        
        positions = []
        movements.each do |movement|
            pos_check = [(pos[0] + movement[0]), (pos[1] + movement[1])]
            if (0...8).to_a.include?(pos_check[0]) && 
                (0...8).to_a.include?(pos_check[1])
                positions << pos_check
            end
        end
        positions
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos).reject do |move|
            @considered_positions.include?(move)
        end
        # @considered_positions += possible_moves
        possible_moves.each do |move|  
            @considered_positions << move
        end
        return possible_moves

    end

    def build_move_tree  
        root = @root_node     
        queue = [root] 
        until queue.empty?
            node = queue.shift 
            pos = node.value
            new_move_positions(pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                node.add_child(next_node)
                queue << next_node
            end
        end
    end

    def find_path(end_pos)
        current_node = @root_node.bfs(end_pos)
        trace_path_back(current_node)
    end

    def trace_path_back(current_node) #node with value [6, 2]
        path = []
        current = current_node

        until current.parent.nil?   
            path.unshift(current.value)
            current = current.parent
        end
        path.unshift(current.value)
        path

        #[[0, 0], [2, 1], [4, 2], [5, 4], [6, 2]]
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

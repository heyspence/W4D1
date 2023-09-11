require "byebug"
require_relative 'ploytree.rb'

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = pos
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        valid_moves = []
        row, col = pos

        if row - 1 >= 0 && col + 2 < 8
            valid_moves << [row - 1, col + 2]
        end
        if row - 2 >= 0 && col - 1 >= 0
            valid_moves << [row - 2, col - 1]
        end
        if row + 1 < 8 && col - 2 >= 0
            valid_moves << [row + 1, col - 2]
        end
        if row + 2 < 8 && col + 1 < 8
            valid_moves << [row + 2, col + 1]
        end
        if row - 1 >= 0 && col - 2 >= 0
            valid_moves << [row - 1, col -2]
        end
        if row - 2 >= 0 && col + 1 < 8
            valid_moves << [row - 2, col + 1]
        end
        if row + 1 < 8 && col + 2 < 8
            valid_moves << [row + 1, col + 2]
        end
        if row + 2 < 8 && col - 1 >= 0
            valid_moves << [row + 2, col - 1]
        end
        valid_moves
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_moves = []
        valid_moves.each do |ele|
            if !@considered_positions.include?(ele)
                new_moves << ele
                @considered_positions << ele
            end
        end
        new_moves
    end

    def build_move_tree(starting_pos)
        queue = [starting_pos]
        until queue.empty?
            current_pos = queue.shift
            queue += new_move_positions(current_pos)

            # Create node for current node
            current_node = PolyTreeNode.new(current_pos)

            # Create a node for each child, with parent relationship to current node
            children = []
            KnightPathFinder.valid_moves(current_pos).each do |child| 
                children << PolyTreeNode.new(child, current_node)
            end
            
            # Establish child relationshps
            children.each do |child|
                current_node.add_child(child)
            end
        end
    end
end

kpf = KnightPathFinder.new([0,0])
kpf.build_move_tree([1,1])
kpf.considered_positions
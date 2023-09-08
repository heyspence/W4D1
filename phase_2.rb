class KnightPathFinder

    attr_reader :root_node

    def initialize(pos)
        @root_node = pos
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        row, col = pos
        if row + 2 < 8 && col + 1 < 8
            pos = [row + 2, col + 1]
            self.new(pos)
        end
        if row - 1 >= 0 && col + 2 < 8
            pos = [row - 1, col + 2]
            self.new(pos)
        end
        if row - 2 >= 0 && col - 1 >= 0
            pos = [row - 2, col - 1]
            self.new(pos)
        end
        if row + 1 < 8 && col - 2 >= 0
            pos = [row + 1, col - 2]
            self.new(pos)
        end
        if row + 2 < 8 && col - 1 >= 0
            pos = [row + 2, col - 1]
            self.new(pos)
        end
        if row - 1 >= 0 && col - 2 >= 0
            pos = [row - 1, col -2]
            self.new(pos)
        end
        if row - 2 >= 0 && col + 1 < 8
            pos = [row - 2, col + 1]
            self.new(pos)
        end
        if row + 1 < 8 && col + 2 < 8
            pos = [row + 1, col + 2]
            self.new(pos)
        end
    end

    def new_move_positions(pos)
        new = KnightPathFinder.new(pos)
        new.each do |ele|
            if !@considered_positions.include?(ele)
                @considered_positions << ele
            end
        end
    end
end

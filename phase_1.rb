class KnightPathFinder

    attr_reader :root_node

    def initialize(pos)
        @root_node = pos
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        valid_moves = []
        row, col = pos


        # starting position
        # if row -2 >= 0
        #     if col - 1 >=0

        #     end

        #     if col + 1 < 8

        #     end
        # end

        # if row -1 >=0
        #     if col - 2 >=0
            
        #     end

        #     if col + 2 < 8

        #     end
        # end

        # if row + 1 < 8
        #     if col -2 >=0

        #     end
            
        #     if col + 2 < 8
        #     end
        # end

        # if row + 2 < 8
        #     if col -1 >= 0
                
        #     end

        #     if col + 1 < 8

        #     end
        # end



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
end

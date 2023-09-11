class Knight

    attr_reader :pos, :neighbors

    def initialize(pos)
        @pos = pos
        @neighbors = []
    end

    def neighbors=(neighbors)
        @neighbors+=neighbors
    end








end
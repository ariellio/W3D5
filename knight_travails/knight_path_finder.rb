require_relative 'poly_tree_node.rb'

# @root_node = PolyTreeNode.new([0,0])

class KnightPathFinder

    def self.valid_moves(pos) # [0,1]
        valid = []
        row, col = pos 
        a = [-3,3]
        b = [1,-1]

        (0...2).each do |i|
          (0...2).each do |j|
            valid << [(row + a[i]), (col + b[j])]
              valid << [(row + b[j]), (col + a[i])]
          end
        end

        valid.reject do |row,col| 
          row < 0 || row > 7  ||  col < 0 || col > 7
        end
    end

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
  end

  def new_move_positions(position)
    poss_positions = KnightPathFinder.valid_moves(position)
    current_positions = []
    poss_positions.each do |pos| 
      if !@considered_positions.include?(pos)
        @considered_positions << pos
        current_positions << pos
      end
    end

    current_positions
  end


end


print KnightPathFinder.valid_moves([0,0])

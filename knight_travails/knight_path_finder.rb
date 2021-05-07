require_relative 'poly_tree_node.rb'

# @root_node = PolyTreeNode.new([0,0])

class KnightPathFinder

    def self.valid_moves(pos) # [0,1]
        valid = []
        row, col = pos 
        nums = [1, 3]
        # while valid.length <= 8
        #   nums.each do |num|

        #   end
          
        # end
        4.times do
          valid << [row + nums[0], col + nums[1]]
          valid << [row - nums[0], col + nums[1]]
        end
          nums.each do |num|
            valid << [row+num, col]
          end

        valid
    end
  def initialize(position)
    @root_node = PolyTreeNode.new(position)
  end
end
=begin


8x8, based off a given position, get all possible moves
Case for north:
  Left: position[r-3][c-1]
  Right: position[r-3][c+1]
Case for south:
  Left: position[r+3][c-1]
  Right: position[r+3][c+1]
Case for east:
  Up: position[r-1][c+3]
  Down: position[r+1][c+3]
Case for west:
  Up: position[r-1][c-3]
  Down: position[r+1][c-3]
  0 1 2 3 4 5 6 7
0   X               => [[1, 3], [3, 1]]
1         O
2 
3   O
4
5
6
7
=end

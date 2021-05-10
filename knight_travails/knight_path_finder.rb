require_relative 'poly_tree_node.rb'

# @root_node = PolyTreeNode.new([0,0])

class KnightPathFinder
  attr_reader :considered_positions, :root_node, :move_tree
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
    build_move_tree
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

  def build_move_tree
    # # {[0,0] => [[1,3], [3,1], [4,5], [5,4]]
    # # [1,3] => [3,1], [4,5], 5,4]
    # # [4,5]
    # # }
    # hash = Hash.new {|h, k| h[k] = []}
    queue = [root_node] #[0,0]
    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value # [0,0]
      arr = new_move_positions(current_pos) #[[1,3], [3,1]]
      arr.each do |pos|
        next_node = PolyTreeNode.new(pos)
        queue << next_node
        current_node.children << next_node # root_node.children == [node with a value of [1,3], node with a value of [3,1]]
      end
    
    end
    
  end
end

knight = KnightPathFinder.new([0,0])


queue = [knight.root_node]
until queue.empty?
  temp = queue.shift
  print "Children for #{temp.value}: "
  temp.children.each do |child|
    print "#{child.value}"
    queue << child
  end
  print "\n"
end
# print KnightPathFinder.valid_moves([0,0])

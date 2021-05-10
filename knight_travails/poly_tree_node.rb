require 'byebug'
class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :parent
    def initialize(value)
        @parent = nil 
        @children = []
        @value = value
    end

    def parent=(node)
        if node == nil 
           @parent = nil 
        elsif @parent != node
          if self.parent != nil
            self.parent.children.reject! {|ele| ele == self }
          end
          @parent = node
          node.children << self 
        end
    end

    def add_child(child_node)
      child_node.parent = self
    end

    def remove_child(child_node)
      if !self.children.include?(child_node)
        raise "does not have child"
      end
      child_node.parent = nil
    end

  
    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child|
            # print child.inspect
            temp = child.dfs(target_value)
            return temp if temp != nil
        end
        nil
    end

    def bfs(target_value)
        # return self if @value == target_value
        queue = [self]  
        until queue.empty?
          temp = queue.shift # queue = [], temp = self
          if temp.value == target_value
            return temp
          else
            temp.children.each do |child|
              queue << child
            end
          end
        end
        
    end

    # def inspect
    #     {'value' => @value, 'parent_value' => @parent.value}.inspect
    # end
end



# self.parent = incomingNode
# incomingNode.children << self


=begin
  a.remove_child(c)
  set c's parent to a, add c to a's children array
    a       d
  /  \
  b   c
  a.parent = d

      d
     / \
    a   f
  /      \
b          c
d.children = [a]
a.children = [b, c]
=end
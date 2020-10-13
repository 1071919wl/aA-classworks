class PolyTreeNode
    attr_reader :value
    attr_accessor :children, :parent

    def initialize(value=nil)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        "#{self.object_id} Value: #{@value}"
    end

    def parent=(parent) #node2 parent to node1 ..... makes node2 parent = node1
        if parent == self.parent
            return #self
        end
        
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent

        unless parent.nil?
            parent.children << self
        end
    end

    def add_child(child)
        child.parent=(self)
    end

    def remove_child(child)
        if child.parent == nil
            raise "Node is not a child"
        end
        child.parent = nil
    end

    def dfs(target)  
        return nil if self == nil
        return self if value == target
        children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result == nil
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            cur_node = queue.shift
            return cur_node if cur_node.value == target
            queue += cur_node.children 
        end
        nil
    end

end #end

        # [1]
    # [2]      [5]
# [3]    [4]      [6]


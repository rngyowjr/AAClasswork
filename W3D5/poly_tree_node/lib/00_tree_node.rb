require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if new_parent == nil
            @parent = new_parent
            return nil
        end

        if new_parent != nil
            if @parent 
                @parent.children.delete(self)
            end

            @parent = new_parent
            return new_parent.children << self unless new_parent.children.include?(self)
        end
    end

    def add_child(new_node)
        new_node.parent=(self)
    end

    def remove_child(child)
        raise "is not a child" if !self.children.include?(child)

        child.parent = nil
    end

    def inspect
        "#{self.value}"
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child| 
            result = child.dfs(target)
            return result unless result == nil
        end
        nil
    end

    def bfs(target)
        array = [self]
        until array.empty?
            el = array.shift
            return el if el.value == target
            el.children.each {|child| array << child}
        end
    end
end

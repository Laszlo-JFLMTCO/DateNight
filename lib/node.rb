require 'pry'

class Node
    attr_reader   :value,
                  :title
    attr_accessor :left,
                  :right

    def initialize (value_in, title_in, left_in = nil, right_in = nil)
        # binding.pry
        @value = value_in
        @title = title_in
        @left = left_in
        @right = right_in
    end

    def node_to_hash
        node_to_hash = {}
        node_to_hash["value"] = @value
        node_to_hash["title"] = @title
        node_to_hash["left"] = @left
        node_to_hash["right"] = @right
        return node_to_hash
    end

end

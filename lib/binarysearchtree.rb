require_relative 'node'
require_relative 'supportmethods'
require 'pry'

class BinarySearchTree
    attr_reader :input_list
                

    def initialize(input_list)
        @input_list = input_list
        @root_number = input_list[0][0]
        root_node = Node.new(@input_list[0][0], @input_list[0][1])
        @binary_tree = {}
        @binary_tree["root"] = @root_number
        @binary_tree[@root_number] = root_node
    end

    def confirm_input
        @input_list
    end

    def root_number
        @root_number
    end

    def adding_into_tree(value_input, title_input)
        new_node = Node.new(value_input, title_input)
        base_value = @root_number
        base_node = @binary_tree[base_value]
        left_right = compare(base_node, new_node)
        depth_count = 1
        while @binary_tree[base_value].node_to_hash[left_right] != nil
            depth_count += 1
            new_node_as_hash = @binary_tree[base_value].node_to_hash
            base_value = new_node_as_hash[left_right]
            left_right = compare(@binary_tree[base_value], new_node)
            # binding.pry
        end
        @binary_tree[base_value].left = new_node.value if left_right == "left"
        @binary_tree[base_value].right = new_node.value if left_right == "right"
        new_node.depth = depth_count
        @binary_tree[new_node.value] = new_node
        # @binary_tree[base_value].depth = depth_count
    end

    def create_binary_tree
        1.upto(@input_list.size-1) do |num|
            adding_into_tree(@input_list[num][0], @input_list[num][1])
        end
        return true
    end

    def insert(inserting_value, inserting_title)
        adding_into_tree(inserting_value, inserting_title)
        return @binary_tree[inserting_value].depth
    end

    # def add_new_number(new_number)
    #     @new_number = new_number
    # end

    # @binarytree = {}
    # @dev_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
    # # @testinput_title = [Back To The Future", "Alien", "Cars", "Spy Game"]
    # @binarytree = {"root" => @input_list[0][0]}
    # binding.pry
    # @root_node = Node.new(@testinput_number[0], @testinput_title[0])
    # @binarytree[@testinput_number[0]] = @root_node
    # binding.pry
    # @testnode = Node.new(0, "")    

end

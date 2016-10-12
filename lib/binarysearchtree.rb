require_relative 'node'
require_relative 'supportmethods'
require 'pry'

class BinarySearchTree
    attr_reader :input_list
                

    def initialize(input_list = [])
        @input_list = input_list
        @root_number = input_list[0][0]
        root_node = Node.new(@input_list[0][0], @input_list[0][1])
        @binary_tree = {}
        @binary_tree["root"] = @root_number
        @binary_tree[@root_number] = root_node

        create_binary_tree
    end

    def confirm_input
        @input_list
    end

    def root_number
        @root_number
    end

    def insert(value_input, title_input)
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
        end
        @binary_tree[base_value].left = new_node.value if left_right == "left"
        @binary_tree[base_value].right = new_node.value if left_right == "right"
        new_node.depth = depth_count
        @binary_tree[new_node.value] = new_node
        # @binary_tree[base_value].depth = depth_count
        return depth_count
    end

    def create_binary_tree
        1.upto(@input_list.size-1) do |num|
            insert(@input_list[num][0], @input_list[num][1])
        end
        return true
    end

    def search_value_in_tree(input_value,title_input)
        new_node = Node.new(input_value, title_input)
        base_value = @root_number
        base_node = @binary_tree[base_value]
        left_right = compare(base_node, new_node)
        depth_count = 1
        while @binary_tree[base_value].node_to_hash[left_right] != nil and @binary_tree[base_value].value != new_node.value
            depth_count += 1
            new_node_as_hash = @binary_tree[base_value].node_to_hash
            base_value = new_node_as_hash[left_right]
            left_right = compare(@binary_tree[base_value], new_node)
        end
        found_or_not = !(@binary_tree[base_value].value != new_node.value)
        return [found_or_not, depth_count - 1] if found_or_not
        return [found_or_not, nil] if !found_or_not
    end

    def include?(input_value)
        return search_value_in_tree(input_value, "")[0]
    end

    def depth_of(input_value)
        return search_value_in_tree(input_value, "")[1]
    end

    def min_max_search(tilting_left_right)
        base_node = @binary_tree[@binary_tree["root"]]
        base_value = base_node.value
        min_max_value = base_node.value
        while @binary_tree[base_value].node_to_hash[tilting_left_right] != nil
            base_value = @binary_tree[base_value].node_to_hash[tilting_left_right]
            min_max_value = @binary_tree[base_value].value if min_max_value < @binary_tree[base_value].value and tilting_left_right == "right"
            min_max_value = @binary_tree[base_value].value if min_max_value > @binary_tree[base_value].value and tilting_left_right == "left"
        end
        return {@binary_tree[min_max_value].title => @binary_tree[min_max_value].value}
    end

    def max
        return min_max_search("right")
    end

    def min
        return min_max_search("left")
    end

    def standardize_input_pairs(input_file_pairs)
        clean_input_file_pairs = []
        input_file_pairs.each do |one_pair|
            one_pair[0] = one_pair[0].to_i
            one_pair[1] = one_pair[1].lstrip.rstrip
            clean_input_file_pairs << one_pair
        end
        return clean_input_file_pairs
    end

    def load(input_filename)
        # input_filename = "./lib/" + input_filename
        # binding.pry
        return 0 if input_filename == ""
        input_file = IO.readlines(input_filename)
        # input_file.gsub!(/\r\n?/, "\n")
        input_file_pairs = []
        input_file.each do |one_pair|
            # input_file_pairs << one_pair.gsub(/\n/, "").split(",")
            input_file_pairs << one_pair.chomp.split(",")
            binding.pry 
        end
        @input_list = standardize_input_pairs(input_file_pairs)
        binding.pry
    end

end
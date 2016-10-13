require_relative 'node'
require_relative 'supportmethods'
require 'pry'

class BinarySearchTree

    def initialize
        @binary_tree = {}
        @sorted_array = []
        @root_number = 0
    end

    def insert(value_input, title_input)
        if @binary_tree == {}
            new_node = Node.new(value_input, title_input)
            @binary_tree[new_node.value] = new_node
            @root_number = new_node.value
            depth_count = 0
        else
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
            @binary_tree[new_node.value] = new_node
        end
        return depth_count
    end

    def search_value_in_tree(input_value,title_input)
        if @binary_tree == {}
            found_or_not = false
        else
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
            found_or_not = @binary_tree[base_value].value == new_node.value
        end
        return [found_or_not, depth_count - 1] if found_or_not
        return [found_or_not, nil] if !found_or_not
    end

    def include?(input_value)
        return search_value_in_tree(input_value, "")[0]
    end

    def depth_of(input_value)
        return search_value_in_tree(input_value, "")[1] if search_value_in_tree(input_value, "")[0]
        return nil if !search_value_in_tree(input_value, "")[0]
    end

    def min_max_search(tilting_left_right)
        base_node = @binary_tree[@root_number]
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

    def create_binary_tree(input_list)
        how_many_entered = 0
        input_list.each do |num|
            if !include?(num[0])
                insert(num[0], num[1])
                how_many_entered += 1
            end
        end
        return how_many_entered
    end

    def load(input_filename)
        return 0 if input_filename == ""
        input_file = IO.readlines(input_filename)
        input_file_pairs = []
        input_file.each do |one_pair|
            input_file_pairs << one_pair.chomp.split(",")
        end
        how_many_entered = create_binary_tree(standardize_input_pairs(input_file_pairs))
        return how_many_entered
    end

    def prepare_sort_output(input_array)
        temp_array = []
        input_array.each do |one_pair|
            temp_array << {one_pair[1] => one_pair[0]}
        end
        return temp_array
    end

    def add_to_sorted_array(input_node)
        return @sorted_array << [input_node.value, input_node.title] if @sorted_array.size == 0
        position = 0
        while position <= @sorted_array.size - 1 and input_node.value > @sorted_array[position][0]
            position += 1
        end
        @sorted_array.insert(position, [input_node.value, input_node.title])
    end

    def sort_scan(input_node)
        if input_node.left != nil
            sort_scan(@binary_tree[input_node.left])
            add_to_sorted_array(@binary_tree[input_node.left])
        end
        if input_node.right != nil
            sort_scan(@binary_tree[input_node.right])
            add_to_sorted_array(@binary_tree[input_node.right])
        end
        return @sorted_array
    end

    def sort
        return [] if @binary_tree == {}
        @sorted_array = []
        sort_scan(@binary_tree[@root_number])
        return prepare_sort_output(@sorted_array)
    end

    def node_count(node_count_input_node)
        if node_count_input_node.left !=nil
            node_count(@binary_tree[node_count_input_node.left])
            @node_count += 1
        end
        if node_count_input_node.right != nil
            node_count(@binary_tree[node_count_input_node.right])
            @node_count += 1
        end
        return @node_count
    end

    def health_scan(input_node)
        if input_node.left !=nil
            health_scan(@binary_tree[input_node.left])
            @node_count = 0
            node_count(@binary_tree[input_node.left])
            @health_report << [input_node.left, @node_count + 1]
            @total_node_count += 1
        end
        if input_node.right != nil
            health_scan(@binary_tree[input_node.right])
            @node_count = 0
            node_count(@binary_tree[input_node.right])
            @health_report << [input_node.right, @node_count + 1]
            @total_node_count += 1
        end
        return {"total_node_count" => @total_node_count, "health_scan_report" => @health_report}        
    end

    def assign_depth_to_health(input_list)
        input_list_with_depth = []
        input_list.each do |item|
            input_list_with_depth << [depth_of(item[0]), item]
        end
        return input_list_with_depth
    end

    def assign_health_calculation(input_list)
        input_list_with_health_calc = []
        input_list.each do |item|
            item_in_percentage = item[1] * 100 / @total_node_count
            item << item_in_percentage
            input_list_with_health_calc << item
        end
        return input_list_with_health_calc
    end

    def final_health_report(input_list, depth_requested)
        health_report = []
        input_list.each do |item|
            health_report << item[1] if item[0] == depth_requested
        end
        return health_report
    end

    def health(depth_requested)
        if @binary_tree != {}
            @health_report = []
            @total_node_count = 1
            health_scan(@binary_tree[@root_number])
            @health_report << [@binary_tree[@root_number].value, @total_node_count]
            return final_health_report(assign_depth_to_health(assign_health_calculation(@health_report)), depth_requested)
        else
            return []
        end
    end

    # def leaves
    #     return 0
    # end

end
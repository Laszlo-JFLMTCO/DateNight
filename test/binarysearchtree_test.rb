require 'minitest/autorun'
require './lib/binarysearchtree'

class BinarySearchTreeTest < Minitest::Test
    def test_initialize_the_BinarySearchTree_Class
        # skip
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal test_input_list, test_tree.confirm_input
    end

    def test_initialize_the_BinarySearchTree_Class_ROOT_NUMBER
        # skip
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal test_input_list[0][0], test_tree.root_number
    end

    def test_create_binary_tree
        # skip
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        assert(test_tree = BinarySearchTree.new(test_input_list))
        # assert_equal true, test_tree.create_binary_tree
    end

    # def test_create_binary_tree_verifying_tree_details_case1
    #     # skip
    #     test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
    #     test_tree = BinarySearchTree.new(test_input_list)
    #     expected_value = 2
    #     expected_title = "Cars"
    #     expected_left = nil
    #     expected_right = nil
    #     assert_equal true, test_tree.create_binary_tree
    # end
    
    def test_inserting_new_value_title_pair_into_binary_tree
        inserting_value = 15
        inserting_title = "Inserting New Title 15"
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal 2, test_tree.insert(inserting_value, inserting_title)
    end

    def test_include_evaluation_of_value_not_in_tree
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        evaluation_value = 99
        assert_equal false, test_tree.include?(evaluation_value)
    end

    def test_include_evaluation_of_value_included_in_tree
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        evaluation_value = 34
        assert_equal true, test_tree.include?(evaluation_value)
    end

    def test_depthof_evaluation_of_value_not_in_tree
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        evaluation_value = 99
        assert_equal nil, test_tree.depth_of(evaluation_value)
    end

    def test_depthof_evaluation_of_value_included_in_tree
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        evaluation_value = 34
        assert_equal 3, test_tree.depth_of(evaluation_value)
    end

    def test_max_method_test
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        expected_return_value = {"Star Wars"=>65}
        assert_equal expected_return_value, test_tree.max
    end

    def test_min_method_test
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        expected_return_value = {"Spy Game"=>2}
        assert_equal expected_return_value, test_tree.min
    end

    def test_loading_test_movies_file_with_empty_string_for_filename
        test_input_file_name = ""
        test_expected_return_value = 0
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal test_expected_return_value, test_tree.load(test_input_file_name)        
    end

    def test_loading_test_movies_file_with_all_new_entries
        # skip
        test_input_file_name = "./test/test_movies.txt"
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)        
        test_tree.load(test_input_file_name)        
    end

    def test_loading_test_movies_file_with_all_some_already_existing_entries
        # test_input_file_name = "test_movies.txt"
        # test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        # test_tree = BinarySearchTree.new(test_input_list)        
    end

end
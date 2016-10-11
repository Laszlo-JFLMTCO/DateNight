require 'minitest/autorun'
require './lib/binarysearchtree'

class BinarySearchTreeTest < Minitest::Test
    def test_initialize_the_BinarySearchTree_Class
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal test_input_list, test_tree.confirm_input
    end

    def test_initialize_the_BinarySearchTree_Class_ROOT_NUMBER
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal test_input_list[0][0], test_tree.root_number
    end

    def test_create_binary_tree
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        assert_equal true, test_tree.create_binary_tree
    end

    def test_create_binary_tree_verifying_tree_details_case1
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        expected_value = 2
        expected_title = "Cars"
        expected_left = nil
        expected_right = nil
        assert_equal true, test_tree.create_binary_tree
    end
    

    def test_insert_new_value_title_pair_into_binary_tree
        inserting_value = 15
        inserting_title = "Inserting New Title 15"
        test_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]
        test_tree = BinarySearchTree.new(test_input_list)
        # assert_equal 2, test_tree.insert(inserting_value, inserting_title)
    end

end
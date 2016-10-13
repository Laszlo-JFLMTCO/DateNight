require 'minitest/autorun'
require './lib/node'

class NodeTest < Minitest::Test
    def test_node_initialization_minimal
        expected_value = 5
        expected_title = "Test Title"
        testnode = Node.new(expected_value, expected_title)
        assert_equal expected_value, testnode.value
        assert_equal expected_title, testnode.title
        assert_equal nil, testnode.left
        assert_equal nil, testnode.right
    end

    def test_node_initialization_complete
        expected_value = 5
        expected_title = "Test Title"
        expected_left = 11
        expected_right = 12
        testnode = Node.new(expected_value, expected_title, expected_left, expected_right)
        assert_equal expected_value, testnode.value
        assert_equal expected_title, testnode.title
        assert_equal expected_left, testnode.left
        assert_equal expected_right, testnode.right
    end

    def test_node_with_various_input_values_1
        expected_value = 100
        expected_title = "100 Test 100 Title 100"
        testnode = Node.new(expected_value, expected_title)
        assert_equal expected_value, testnode.value
        assert_equal expected_title, testnode.title
        assert_equal nil, testnode.left
        assert_equal nil, testnode.right
    end

    def test_node_with_various_input_values_2
        expected_value = 200
        expected_title = "200 Test 200 Title 200"
        testnode = Node.new(expected_value, expected_title)
        expected_left = 21
        expected_right = 22
        testnode = Node.new(expected_value, expected_title, expected_left, expected_right)
        assert_equal expected_value, testnode.value
        assert_equal expected_title, testnode.title
        assert_equal expected_left, testnode.left
        assert_equal expected_right, testnode.right
    end

    def test_node_with_various_input_values_3
        expected_value = 300
        expected_title = "300 Test 300 Title 300"
        testnode = Node.new(expected_value, expected_title)
        expected_left = {300 => {"left" => 333, "right" => 366}}
        expected_right = {300 => {"left" => 344, "right" => 377}}
        testnode = Node.new(expected_value, expected_title, expected_left, expected_right)
        assert_equal expected_value, testnode.value
        assert_equal expected_title, testnode.title
        assert_equal expected_left, testnode.left
        assert_equal expected_right, testnode.right
    end

    def test_node_to_hash_conversion_case1
        expected_value = 100
        expected_title = "100 Test 100 Title 100"
        testnode = Node.new(expected_value, expected_title)
        testnode_as_hash = testnode.node_to_hash
        assert_equal expected_value, testnode_as_hash["value"]
        assert_equal expected_title, testnode_as_hash["title"]
        assert_equal nil, testnode_as_hash["left"]
        assert_equal nil, testnode_as_hash["right"]
    end

    def test_node_to_hash_conversion_case2
        expected_value = 200
        expected_title = "200 Test 200 Title 200"
        expected_left = 240
        expected_right = 280
        testnode = Node.new(expected_value, expected_title, expected_left, expected_right)
        testnode_as_hash = testnode.node_to_hash
        assert_equal expected_value, testnode_as_hash["value"]
        assert_equal expected_title, testnode_as_hash["title"]
        assert_equal expected_left, testnode_as_hash["left"]
        assert_equal expected_right, testnode_as_hash["right"]
    end    

end
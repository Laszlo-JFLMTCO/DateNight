require 'minitest/autorun'
require './lib/supportmethods'

class SupportMethodsTest < Minitest::Test
    def test_compare_returns_left_when_new_is_smaller_than_ref_case1
        testreferencenode = Node.new(8, "Test Reference Node Title 8")
        testnewnode = Node.new(5, "Test Left Node Title 5")
        assert_equal "left", compare(testreferencenode, testnewnode)
    end

    def test_compare_returns_left_when_new_is_smaller_than_ref_case2
        testreferencenode = Node.new(12, "Test Reference Node Title 12")
        testnewnode = Node.new(1, "Test Left Node Title 1")
        assert_equal "left", compare(testreferencenode, testnewnode)
    end

    def test_compare_returns_right_when_new_is_greater_than_ref_case1
        testreferencenode = Node.new(8, "Test Reference Node Title 8")
        testnewnode = Node.new(10, "Test Left Node Title 10")
        assert_equal "right", compare(testreferencenode, testnewnode)
    end

    def test_compare_returns_right_when_new_is_greater_than_ref_case2
        testreferencenode = Node.new(15, "Test Reference Node Title 15")
        testnewnode = Node.new(21, "Test Left Node Title 21")
        assert_equal "right", compare(testreferencenode, testnewnode)
    end

end
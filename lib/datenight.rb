require_relative 'binarysearchtree'
require 'pry'

dev_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]

tree = BinarySearchTree.new(dev_input_list)
tree.create_binary_tree
        inserting_value = 15
        inserting_title = "Inserting New Title 15"
tree.insert(inserting_value, inserting_title)
# is_included = tree.include?(99)
binding.pry

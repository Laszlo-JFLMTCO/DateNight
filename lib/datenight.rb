require_relative 'binarysearchtree'
require 'pry'

dev_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]

tree = BinarySearchTree.new(dev_input_list)
binding.pry

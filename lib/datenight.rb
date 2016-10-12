require_relative 'binarysearchtree'
require 'pry'

dev_input_list = [[18, "Terminator"], [25, "Back To The Future"], [65, "Star Wars"], [34, "Cars"], [2, "Spy Game"]]


tree = BinarySearchTree.new
# tree.insert(18, "Terminator")
# tree.insert(25, "Back To The Future")
# tree.insert(65, "Star Wars")
# tree.insert(34, "Cars")
# tree.insert(2, "Spy Game")
count = tree.load("./lib/movies.txt")
is_included = tree.include?(99)
is_included2 = tree.include?(34)
depth_of = tree.depth_of(99)
depth_of2 = tree.depth_of(34)
max = tree.max
min = tree.min
binding.pry

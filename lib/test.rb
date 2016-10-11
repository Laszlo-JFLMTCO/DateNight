require 'pry'
require './lib/node'

@binarytree = {}
@testinput_number = [18, 25, 65, 34, 2]
@testinput_title = ["Terminator", "Back To The Future", "Alien", "Cars", "Spy Game"]
    @binarytree = {"root" => @testinput_number[0]}
    binding.pry
    @root_node = Node.new(@testinput_number[0], @testinput_title[0])
    @binarytree[@testinput_number[0]] = @root_node
    binding.pry
    @testnode = Node.new(0, "")    

def compare(ref_node, new_node)
    binding.pry
    return "left" if ref_node.value > new_node.value
    return "right" if ref_node.value < new_node.value
end

def buildingtree(value_input, title_input)
    input_node = Node.new(value_input, title_input)
    puts compare(@root_node, input_node)
end



1.upto(@testinput_number.size-1) do |num|
    buildingtree(@testinput_number[num], @testinput_title[num])
end
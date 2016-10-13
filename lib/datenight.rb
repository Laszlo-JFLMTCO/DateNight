require_relative 'binarysearchtree'
require 'pry'

tree = BinarySearchTree.new
#Copied from DateNight Project markdown
insert61 = tree.insert(61, "Bill & Ted's Excellent Adventure")
# => 0
insert16 = tree.insert(16, "Johnny English")
# => 1
insert92 = tree.insert(92, "Sharknado 3")
# => 1
insert50 = tree.insert(50, "Hannibal Buress: Animal Furnace")
# => 2
include16 = tree.include?(16)
# => true
include72 = tree.include?(72)
# => false
include92 = tree.depth_of(92)
# => 1
include50 = tree.depth_of(50)
# => 2
max = tree.max
# => {"Sharknado 3"=>92}
min = tree.min
# => {"Johnny English"=>16}
sort = tree.sort
# => [{"Johnny English"=>16},
#   {"Hannibal Buress: Animal Furnace"=>50},
#   {"Bill & Ted's Excellent Adventure"=>61},
#  {"Sharknado 3"=>92}]

tree = BinarySearchTree.new
insert98 = tree.insert(98, "Animals United")
insert58 = tree.insert(58, "Armageddon")
insert36 = tree.insert(36, "Bill & Ted's Bogus Journey")
insert93 = tree.insert(93, "Bill & Ted's Excellent Adventure")
insert86 = tree.insert(86, "Charlie's Angels")
insert38 = tree.insert(38, "Charlie's Country")
insert69 = tree.insert(69, "Collateral Damage")
health0 = tree.health(0)
# => [[98, 7, 100]]
health1 = tree.health(1)
# => [[58, 6, 85]]
health2 = tree.health(2)
# => [[36, 2, 28], [93, 3, 42]]
binding.pry
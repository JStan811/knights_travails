# frozen_string_literal: true

# this is just for code that I don't need now but may need in the future.
# aka I spent a lot of time on it and it hurts to throw away

# iterative attempt for DataStructure#build_structure

# root.children.each do |child|
#   # puts 'level 1'
#   # puts "child: #{child.position}"
#   all_possible_destination_cells(child).each do |dest|
#     # puts "destination: #{dest.position}"
#     child.children << dest unless level_order(root).include?(dest.position)
#   end
#   # puts "grandchildren: #{child.children}"
# end

# root.children.each do |child|
#   child.children.each do |grandchild|
#     puts 'level 2'
#     puts "grandchild: #{grandchild.position}"
#     all_possible_destination_cells(grandchild).each do |dest|
#       puts "destination: #{dest.position}"
#       grandchild.children << dest unless level_order(root).include?(dest.position)
#     end
#     puts "grandgrandchildren: #{child.children}"
#   end
# end

# root.children.each do |child|
#   child.children.each do |grandchild|
#     grandchild.children.each do |grandgrandchild|
#       puts 'level 3'
#       puts "grandgrandchild: #{grandchild.position}"
#       all_possible_destination_cells(grandchild).each do |dest|
#         puts "destination: #{dest.position}"
#         grandchild.children << dest unless level_order(root).include?(dest.position)
#       end
#       puts "grandgrandgrandchildren: #{child.children}"
#     end
#   end
# end
# root

# frozen_string_literal: true

require_relative 'data_structure'
require_relative 'cell'

root_cell = KnightsTravails::Cell.new([3, 3])
# test_cell = KnightsTravails::Cell.new([1, 4])
my_data_structure = KnightsTravails::DataStructure.new(root_cell)

puts 'Full structure'
p my_data_structure

# p my_data_structure.level_order.count
# p my_data_structure.level_order.uniq.count

p my_data_structure.level_order

p my_data_structure.level_order.count

# p my_data_structure.all_possible_destination_cells(test_cell)

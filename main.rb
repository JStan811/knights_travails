# frozen_string_literal: true

require_relative 'data_structure'
require_relative 'cell'

root_cell = KnightsTravails::Cell.new([3, 3])
my_data_structure = KnightsTravails::DataStructure.new(root_cell)

p my_data_structure

# p my_data_structure.level_order.count
# p my_data_structure.level_order.uniq.count

p my_data_structure.level_order.uniq == my_data_structure.level_order

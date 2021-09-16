# frozen_string_literal: true

require_relative 'data_structure'
require_relative 'cell'

root_cell = KnightsTravails::Cell.new([7, 0])
target_cell = KnightsTravails::Cell.new([0, 0])
my_data_structure = KnightsTravails::DataStructure.new(root_cell)

my_data_structure.knight_moves(target_cell)

# frozen_string_literal: true

module KnightsTravails
  # data structure representing total possible knight moves on chess board from
  # a given starting position
  class DataStructure
    def initialize(root_cell)
      @root_cell = build_structure(root_cell)
    end

    attr_reader :root_cell, :structure

    def level_order(root = @root_cell, result_array = [], queue = [])
      # base case
      return result_array if root.nil?

      result_array << root.position
      queue << root.children unless root.children.nil?
      queue.flatten!
      root = queue.shift
      level_order(root, result_array, queue)
    end

    private

    # rubocop: disable Metrics
    def build_structure(root)
      # may need some kind of queueing so the recursion stops after all
      # children of one node, then goes back a level to do the next node at
      # that level

      # Find all possible destination from root
      # then, add destination as child of that child unless the destination
      # already exists in the structure
      all_possible_destination_cells(root).each do |dest|
        root.children << dest unless level_order(root).include?(dest.position)
      end

      root.children.each do |child|
        all_possible_destination_cells(child).each do |dest|
          child.children << dest unless level_order(root).include?(dest.position)
        end
      end
      root
    end
    # rubocop: enable Metrics

    # rubocop: disable Metrics
    def all_possible_destination_cells(root_cell)
      # array of cells
      possible_moves = []
      x = root_cell.position[0]
      y = root_cell.position[1]
      possible_moves << Cell.new([x + 1, y - 2]) if valid_position?(x + 1, y - 2)
      possible_moves << Cell.new([x + 2, y - 1]) if valid_position?(x + 2, y - 1)
      possible_moves << Cell.new([x + 2, y + 1]) if valid_position?(x + 2, y + 1)
      possible_moves << Cell.new([x + 1, y + 2]) if valid_position?(x + 1, y + 2)
      possible_moves << Cell.new([x - 1, y + 2]) if valid_position?(x - 1, y + 2)
      possible_moves << Cell.new([x - 2, y + 1]) if valid_position?(x - 2, y + 1)
      possible_moves << Cell.new([x - 2, y - 1]) if valid_position?(x - 2, y - 1)
      possible_moves << Cell.new([x - 1, y - 2]) if valid_position?(x - 2, y - 2)
      possible_moves
    end
    # rubocop: enable Metrics

    def valid_position?(x_coord, y_coord)
      return false if x_coord.negative? || x_coord > 7 || y_coord.negative? || y_coord > 7

      true
    end
  end
end

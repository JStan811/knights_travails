# frozen_string_literal: true

module KnightsTravails
  # data structure representing total possible knight moves on chess board from
  # a given starting position
  class DataStructure
    def initialize(root_cell)
      @root_cell = root_cell
      @structure = build_structure(root_cell)
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
    def build_structure(root, queue = [])
      # it would be faster to perform the search and the build at the same
      # time since once the shortest path is found there's no reason to keep
      # building. But by separating them it may quicken performing a
      # second search with a different target

      return root if root.nil?

      # Find all possible destinations from root
      # then, add destination as child unless the destination
      # already exists in the structure
      all_possible_destination_cells(root).each do |dest|
        root.children << dest unless level_order(@root_cell).include?(dest.position)
      end

      # use queue to ensure the structure is built one level at a time
      # in a way, I'm building this breadth-first instead of depth-first
      # this is so the branches always represent the shortest path to a node
      # from the root
      queue << root.children unless root.children.nil?
      queue.flatten!
      root = queue.shift
      build_structure(root, queue)
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
      possible_moves << Cell.new([x - 1, y - 2]) if valid_position?(x - 1, y - 2)
      possible_moves
    end
    # rubocop: enable Metrics

    def valid_position?(x_coord, y_coord)
      return false if x_coord.negative? || x_coord > 7 || y_coord.negative? || y_coord > 7

      true
    end
  end
end

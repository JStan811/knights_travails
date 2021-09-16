# frozen_string_literal: true

module KnightsTravails
  # data structure representing total possible knight moves on chess board from
  # a given starting position
  class DataStructure
    def initialize(root_cell)
      @root_cell = root_cell
      build_structure(root_cell)
    end

    attr_reader :root_cell

    # rubocop: disable Metrics
    def knight_moves(target_cell, root = @root_cell, path = [], target_found = false)
      # guard clause in case target is initial cell
      if @root_cell.position == target_cell.position
        puts "You're already here!"
        return
      end

      # base case
      if root.position == target_cell.position
        target_found = true
        path << root.position
        puts "You made it in #{path.length - 1} moves!"
        puts 'Path taken:'
        path.each { |position| puts " -> #{position}" }
        return
      end

      path << root.position

      unless root.children.empty?
        root.children.each do |child|
          break if target_found == true
          
          knight_moves(target_cell, child, path, target_found)
        end
      end

      # remove cell from path array if it is a leaf and not the target
      # before going back up a level
      path.pop
    end
    # rubocop: enable Metrics

    private

    def level_order(root = @root_cell, result_array = [], queue = [])
      # base case
      return result_array if root.nil?

      result_array << root.position
      queue << root.children unless root.children.nil?
      queue.flatten!
      root = queue.shift
      level_order(root, result_array, queue)
    end

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

# frozen_string_literal: true

module KnightsTravails
  # object representing invidual cell on a chess board
  class Cell
    def initialize(position, children = [])
      @position = position
      @children = children
    end

    attr_accessor :position, :children
  end
end

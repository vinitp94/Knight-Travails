require_relative 'poly_tree_node'

class KnightPathFinder
  attr_reader :node

  BOARD_SIZE = 8
  DELTA = [
    [-1, 2],
    [1, 2],
    [2, 1],
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1]
  ].freeze


  def initialize(pos = [0, 0])
    @node = PolyTreeNode.new(pos)
  end

  def new_move_positions(pos)
    row, col = pos
    positions = DELTA.map { |delta| [delta[0] + row, delta[1] + col] }
    positions.select { |position| valid_move?(position) }
  end

  def valid_move?(pos)
    row, col = pos
    row >= 0 && col >= 0 && row < BOARD_SIZE && col < BOARD_SIZE
  end

  def build_move_tree

  end

  def find_path(pos)

  end

end

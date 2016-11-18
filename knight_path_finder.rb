require_relative 'poly_tree_node'

class KnightPathFinder
  attr_reader :root

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
    @root = PolyTreeNode.new(pos)
    build_move_tree
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
    queue = [root]
    until queue.empty?
      current = queue.shift
      new_move_positions(current.value).each do |move|
        unless root.dfs(move)
          child = PolyTreeNode.new(move)
          child.parent = current
          queue.push(child)
        end
      end
    end
  end

  def find_path(pos)
    path = []
    target = root.dfs(pos)
    until target.parent.nil?
      path.unshift(target.value)
      target = target.parent
    end
    path.unshift(root.value)
    path
  end

end

kpf = KnightPathFinder.new

p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

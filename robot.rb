# robot.rb
require_relative 'directions'
require_relative 'grid'

class Robot
  attr_reader :position

  def initialize(grid: Grid.new, start_at: [0, 0])
    @grid = grid
    @position = valid_position?(start_at) ? start_at.dup : raise_invalid_position(start_at)
  end

  def move(command)
    command.split(',').each do |cmd|
      cmd = cmd.strip.upcase
      next unless Directions.valid?(cmd)

      dx, dy = Directions.delta(cmd)
      new_pos = [@position[0] + dx, @position[1] + dy]
      @position = new_pos if valid_position?(new_pos)
    end
  end

  def reset(position_to: [0, 0])
    @position = valid_position?(position_to) ? position_to.dup : raise_invalid_position(position_to)
  end

  private

  def valid_position?(pos)
    pos.is_a?(Array) &&
      pos.size == 2 &&
      pos.all? { |n| n.is_a?(Integer) } &&
      @grid.in_bounds?(pos[0], pos[1])
  end

  def raise_invalid_position(pos)
    raise ArgumentError, "Invalid position: #{pos.inspect} position must be within grid bounds"
  end
end

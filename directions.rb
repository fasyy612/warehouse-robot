module Directions
  DIRECTIONS = {
    'N' => [0, 1],
    'S' => [0, -1],
    'E' => [1, 0],
    'W' => [-1, 0]
  }.freeze

  def self.valid?(command)
    DIRECTIONS.key?(command)
  end

  def self.delta(command)
    DIRECTIONS[command]
  end

  def self.all
    DIRECTIONS.keys
  end
end
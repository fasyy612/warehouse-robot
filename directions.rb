module Directions
  VALID_DIRECTIONS = {
    'N' => [0, 1],
    'S' => [0, -1],
    'E' => [1, 0],
    'W' => [-1, 0]
  }.freeze

  def self.valid?(command)
    VALID_DIRECTIONS.key?(command)
  end

  def self.delta(command)
    VALID_DIRECTIONS[command]
  end

  def self.all
    VALID_DIRECTIONS.keys
  end
end
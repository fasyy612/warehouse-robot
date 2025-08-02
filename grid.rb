# grid.rb

class Grid
  attr_reader :width, :height

  def initialize(width: 10, height: 10)
    raise ArgumentError, 'Grid size is invalid' unless width.positive? && height.positive?

    @width = width
    @height = height
  end

  def in_bounds?(x, y)
    x.between?(0, width - 1) && y.between?(0, height - 1)
  end
end

require 'minitest/autorun'
require_relative 'robot'

class RobotTest < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_starts_at_origin
    assert_equal [0, 0], @robot.position
  end

  def test_moves_north
    @robot.move("N")
    assert_equal [0, 1], @robot.position
  end

  def test_moves_square_and_returns
    @robot.move("N,E,S,W")
    assert_equal [0, 0], @robot.position
  end

  def test_moves_diagonal_to_center
    @robot.move("N,E,N,E,N,E,N,E")
    assert_equal [4, 4], @robot.position
  end

  def test_prevents_moving_west_off_grid
    @robot.move("W,W,W")
    assert_equal [0, 0], @robot.position
  end

  def test_prevents_moving_south_off_grid
    @robot.move("S,S,S")
    assert_equal [0, 0], @robot.position
  end

  def test_limits_to_north_boundary
    @robot.move("N," * 15)
    assert_equal [0, 9], @robot.position
  end

  def test_limits_to_east_boundary
    @robot.move("E," * 15)
    assert_equal [9, 0], @robot.position
  end

  def test_ignores_invalid_commands
    @robot.move("N,X,Y,E")
    assert_equal [1, 1], @robot.position
  end
end

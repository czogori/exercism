defmodule RobotSimulator do

  @valid_directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, _) when direction not in @valid_directions, do: {:error, "invalid direction"}
  def create(_, {x, y}) when not is_integer(x) or not is_integer(y), do: {:error, "invalid position"}
  def create(direction, {_, _} = position) do
    %{
      direction: direction,
      position: position,
    }
  end
  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.codepoints()
    |> parser(robot)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position

  def parser([], robot), do: robot
  def parser([h|t], %{direction: direction} = robot) when h in ["L", "R"], do:
    parser(t, %{robot | direction: transition_direction(direction, h)})
  def parser([h|t], %{direction: direction, position: position} = robot) when h == "A", do:
    parser(t, %{robot | position: move(position, direction)})
  def parser(_, _), do: {:error, "invalid instruction"}

  defp transition_direction(:north, "L"), do: :west
  defp transition_direction(:north, "R"), do: :east
  defp transition_direction(:south, "L"), do: :east
  defp transition_direction(:south, "R"), do: :west
  defp transition_direction(:west,  "L"), do: :south
  defp transition_direction(:west,  "R"), do: :north
  defp transition_direction(:east,  "L"), do: :north
  defp transition_direction(:east,  "R"), do: :south

  defp move({x, y}, :north), do: {x, y + 1}
  defp move({x, y}, :south), do: {x, y - 1}
  defp move({x, y}, :west), do:  {x - 1, y}
  defp move({x, y}, :east), do:  {x + 1, y}
end

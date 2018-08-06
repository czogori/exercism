defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(1), do: [[1]]
  def rows(2), do: rows(1) ++ [[1,1]]
  def rows(num) do
    previous_all = rows(num - 1)
    previous = List.last(previous_all)
    current = [[1] ++ Enum.map(1..num-2, fn x -> Enum.at(previous, x - 1) + Enum.at(previous, x) end) ++ [1]]
    previous_all ++ current
  end
end

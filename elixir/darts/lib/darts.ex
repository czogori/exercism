defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
    |> case do
      res when res > 10 -> 0
      res when res > 5 and res <= 10 -> 1
      res when res > 1 and res <= 5 -> 5
      res when res >= 0 and res <= 1 -> 10
    end
  end
end

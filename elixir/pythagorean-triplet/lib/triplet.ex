defmodule Triplet do
  @doc """
  Calculates sum of a given triplet of integers.
  """
  @spec sum([non_neg_integer]) :: non_neg_integer
  def sum([a, b, c]) do
    a + b + c
  end

  @doc """
  Calculates product of a given triplet of integers.
  """
  @spec product([non_neg_integer]) :: non_neg_integer
  def product([a, b, c]) do
    a * b * c
  end

  @doc """
  Determines if a given triplet is pythagorean. That is, do the squares of a and b add up to the square of c?
  """
  @spec pythagorean?([non_neg_integer]) :: boolean
  def pythagorean?([a, b, c]) do
    round(:math.pow(a, 2)) + round(:math.pow(b, 2)) == round(:math.pow(c, 2))
  end

  @doc """
  Generates a list of pythagorean triplets from a given min (or 1 if no min) to a given max.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max) do
    items(min, max) |> Enum.filter(&pythagorean?/1)
  end

  @doc """
  Generates a list of pythagorean triplets from a given min to a given max, whose values add up to a given sum.
  """
  @spec generate(non_neg_integer, non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max, sum) do
    generate(min, max) |> Enum.filter(fn i -> sum(i) == sum end)
  end

  defp items(min, max) do
    for a <- min..max do
      for b <- min..max do
        for c <- min..max do
          [a, b, c] |> Enum.sort()
        end
      end
    end
    |> Enum.flat_map(& &1)
    |> Enum.flat_map(& &1)
    |> Enum.uniq()
  end
end

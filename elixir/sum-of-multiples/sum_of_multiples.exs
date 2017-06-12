defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors 
    |> Enum.map(&multi(limit, &1)) 
    |> Enum.flat_map(&(&1)) 
    |> Enum.uniq 
    |> Enum.sum
  end

  def multi(limit, factor, sum \\ 0) do
    if limit > sum do
      [sum | multi(limit, factor, sum + factor)]
    else
      [0]
    end
  end
end

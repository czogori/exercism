defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number in [-1, 0], do: {:error, "Classification is only possible for natural numbers."}
  def classify(1), do: {:ok, :deficient}
  def classify(number) do
    sum = sum_factors(number)
    cond do
      sum === number -> {:ok, :perfect}
      sum > number -> {:ok, :abundant}
      sum < number -> {:ok, :deficient}
    end
  end

  defp sum_factors(number, factor \\ 1)
  defp sum_factors(number, factor) when number === factor, do: 0
  defp sum_factors(number, factor) when rem(number, factor) === 0, do: factor + sum_factors(number, factor + 1)
  defp sum_factors(number, factor), do: sum_factors(number, factor + 1)
end

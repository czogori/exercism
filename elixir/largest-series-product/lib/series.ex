defmodule Series do
  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t(), non_neg_integer) :: non_neg_integer
  def largest_product(_number_string, 0), do: 1
  def largest_product(number_string, size)
    when byte_size(number_string) < size or size < 0, do: raise ArgumentError
  def largest_product(number_string, size) do
    number_string
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
    |> find_product(size)
  end

  defp find_product(numbers, size, max \\ 0)
  defp find_product([], _, max), do: max
  defp find_product(numbers, size, max) when length(numbers) < size, do: max
  defp find_product([_|t] = numbers, size, max) do
    max = numbers
    |> Enum.take(size)
    |> Enum.reduce(1, & &1 * &2)
    |> find_max(max)

    find_product(t, size, max)
  end

  defp find_max(candidate, current_max) when candidate > current_max, do: candidate
  defp find_max(_, current_max), do: current_max
end

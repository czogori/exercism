defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @digits ~w(0 1 2 3 4 5 6 7 8 9)
  @letters ~w(a b c d e f)

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.downcase
    |> String.codepoints
    |> Enum.reverse
    |> calc
    |> round
  end

  defp calc(list, acc \\ 0, pow \\ 0)
  defp calc([], acc, _), do: acc
  defp calc([h|t], acc, pow) when h in @letters, do: calc(t, acc, pow, decimal_digit(h))
  defp calc([h|t], acc, pow) when h in @digits, do: calc(t, acc, pow, String.to_integer(h))
  defp calc([_|_], _, _),  do: 0
  defp calc(list, acc, pow, int), do: calc(list, acc + int * :math.pow(16, pow), pow + 1)

  defp decimal_digit("a"), do: 10
  defp decimal_digit("b"), do: 11
  defp decimal_digit("c"), do: 12
  defp decimal_digit("d"), do: 13
  defp decimal_digit("e"), do: 14
  defp decimal_digit("f"), do: 15
end

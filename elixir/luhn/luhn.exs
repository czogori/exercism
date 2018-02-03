defmodule Luhn do

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number = String.replace(number, " ", "")
    if Regex.match?(~r/^[0-9]+$/, number) && String.length(number) > 1 do
      number <> "0"
      |> String.codepoints()
      |> Enum.reverse()
      |> Enum.map(& String.to_integer(&1))
      |> Enum.map_every(2, &double(&1))
      |> Enum.sum()
      |> rem(10) == 0
    else
      false
    end
  end

  def double(digit) do
    doubled = digit * 2
    if doubled > 9, do: doubled - 9, else: doubled
  end
end

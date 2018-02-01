defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if correct_digits?(string) do
      string
      |> String.split("", trim: true)
      |> Enum.reverse()
      |> Enum.reduce({0,0}, fn(num, {index, current_result}) ->   
        {index + 1, current_result + if(num == "1", do: :math.pow(2, index), else: 0) } end)
      |> get_result()
    else
      0
    end
  end

  defp get_result({_, result}), do: round(result)
  defp correct_digits?(string), do: Regex.match?(~r/^[01]+$/, string)
end

defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number 
    |> Integer.to_string()
    |> String.codepoints()
    |> convert()
  end

  defp convert([]), do: ""
  defp convert([h|t]) do
    i = String.to_integer(h)
    m = map([h|t])
    case i do
      0 -> ""
      i when i in 1..3 -> String.duplicate(m[:low], i)
      4 -> m[:low] <> m[:medium]
      5 -> m[:medium]
      i when i in 6..8 -> m[:medium] <> String.duplicate(m[:low], i - 5)
      9 -> m[:low] <> m[:high]
    end <> convert(t)
  end
  
  defp map(number) when length(number) == 1, do: %{low: "I", medium: "V", high: "X" }
  defp map(number) when length(number) == 2, do: %{low: "X", medium: "L", high: "C" }
  defp map(number) when length(number) == 3, do: %{low: "C", medium: "D", high: "M" }
  defp map(number) when length(number) == 4, do: %{low: "M" }
end

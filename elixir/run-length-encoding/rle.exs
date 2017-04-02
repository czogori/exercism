defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(s) do
    s
    |> String.codepoints
    |> encoder
    |> Enum.join
  end
  
  defp encoder([a, a | rest]), do: encoder([{a,2} | rest])
  defp encoder([{a, n}, a | rest]), do: encoder([{a, n+1} | rest])
  defp encoder([a | rest]), do: [a | encoder(rest)] |> Enum.map(&link/1)
  defp encoder([]), do: []
  
  defp link({a,b}), do: Integer.to_string(b) <> a
  defp link(a), do: a

  @spec decode(String.t) :: String.t
   def decode(string) when is_bitstring(string) do
    string
    |> String.codepoints
    |> Enum.map(fn n -> case Integer.parse(n) do 
      {result, _} -> result
      _ -> n
      end end)
    |> decoder
    |> Enum.join
  end

defp decoder([a, b | t]) when is_integer(a) and is_integer(b) do
  s = Integer.to_string(a) <> Integer.to_string(b)
  {int, _} = Integer.parse(s)
  decoder([int | t])
end

defp decoder([a, b | tail]) when is_bitstring(a) and is_integer(b), do: [a | decoder([b | tail])]
defp decoder([a, b | tail]) when is_integer(a), do: [String.duplicate(b, a) | decoder(tail)]
defp decoder(list) when is_list(list), do: list
defp decoder([]), do: []
end

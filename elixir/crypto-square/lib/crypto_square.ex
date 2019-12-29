defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(str) do
    str_normalized = normalize(str)
    str_len = String.length(str_normalized)
    {column, row, res} = find(str_len)

    str_normalized
    |> String.codepoints()
    |> Enum.chunk_every(column, column, pad(res, str_len))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.flat_map(fn x -> x end)
    |> Enum.chunk_every(row)
    |> Enum.join(" ")
  end

  defp normalize(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
  end

  defp find(str_len, column \\ 2, row_offset \\ 1) do
    row = column - row_offset
    res = column * row
    if res >= str_len do
      {column, row, res}
    else
      offset = abs(1 - row_offset)
      find(str_len, column + offset, offset)
    end
  end

  defp pad(res, len) when res == len, do: []
  defp pad(res, len) when res > len,
    do: String.duplicate(" ", res - len - 1) |> String.split(" ")
end

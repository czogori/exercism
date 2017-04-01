defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size)  when size <= 0, do: []
  def slices(s, size) do
    s
    |> String.split("", trim: true)
    |> Enum.chunk(size, 1)
    |> Enum.map(&Enum.join/1)
  end
end


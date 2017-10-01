defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    list = sentence |> String.replace(~r/[ -]/, "") |> String.codepoints
    Enum.count(list) == Enum.sort(list) |> Enum.dedup |> Enum.count
  end
end

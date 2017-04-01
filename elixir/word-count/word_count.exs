defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words = sentence
     |> String.downcase
     |> String.replace(~r/[^[:alpha:]\d\s-]/u, " ")
     |> String.split
    Map.new(words, fn x -> {x, Enum.count(words, fn y -> y == x end)} end)
  end
end

defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @map %{
    "a" => 1,
    "b" => 3,
    "c" => 3,
    "d" => 2,
    "e" => 1,
    "f" => 4,
    "g" => 2,
    "h" => 4,
    "i" => 1,
    "j" => 8,
    "k" => 5,
    "l" => 1,
    "m" => 4,
    "n" => 1,
    "o" => 1,
    "p" => 3,
    "q" => 10,
    "r" => 1,
    "s" => 1,
    "t" => 1,
    "u" => 1,
    "v" => 4,
    "w" => 4,
    "x" => 8,
    "y" => 4,
    "z" => 10,
  }

  @spec score(String.t) :: non_neg_integer
  def score(""), do: 0
  def score(word) do
    w = word |> String.trim |> String.downcase
    if String.length(w) > 0 do
      [h|t] = String.codepoints(w)
      @map[h] + score(Enum.join(t))
    else
      0
    end
  end
end

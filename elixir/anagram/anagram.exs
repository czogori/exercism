defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn(x) -> conv(x) == conv(base) && 
      String.downcase(x) != String.downcase(base) end)
  end

  defp conv(word) do
    word 
    |> String.downcase 
    |> String.codepoints 
    |> Enum.sort 
    |> Enum.join
  end
end

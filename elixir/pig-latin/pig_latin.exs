defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase) |> _translate() |> Enum.join(" ")
  end

  defp _translate([]), do: []
  defp _translate([h | t]) do
    cond do
      h  =~ ~r/^xr/ ||  h  =~ ~r/^yt/ || h  =~ ~r/^[aeiou]/ -> [h <> "ay" | _translate(t)]   
      true -> 
        consonants = ["^sch", "^thr", "^th", "^ch", "^[^aeiou]qu", "^qu", "^[^aeiou]"]
        [Enum.find(consonants, fn n -> h =~ ~r/#{n}/ end) |> _consonants(h) | _translate(t)]
    end
  end

  defp _consonants(regex, text) do
    [h|_t] = Regex.run(~r/#{regex}/, text)
    String.trim_leading(text, h) <> h <> "ay"
  end
end


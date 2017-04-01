defmodule Bob do
  def hey(input) do
    cond do
        String.ends_with?(input, "?") -> "Sure."
        String.trim(input) == "" -> "Fine. Be that way!"
        input == String.upcase(input) && input != String.downcase(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end

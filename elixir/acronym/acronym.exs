defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> Macro.underscore
    |> String.split([" ", "-", "_"])
    |> Enum.map(fn n -> String.first(n) end)
    |> Enum.join
    |> String.upcase
  end
end

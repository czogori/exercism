defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input), do: transform_list(Map.to_list(input))
  
  defp transform_list([]), do: %{}
  defp transform_list([{count, items} | t]) do
    items
    |> Enum.map(&{String.downcase(&1), count})
    |> Map.new
    |> Map.merge(transform_list(t))
  end
end

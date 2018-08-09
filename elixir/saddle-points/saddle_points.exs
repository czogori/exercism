defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(fn i -> String.split(i) |> Enum.map(fn x -> String.to_integer(x) end) end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> trans
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows_max = str 
    |> rows 
    |> Enum.map(fn x -> Enum.max(x) end)

    columns_min = str
    |> columns
    |> Enum.map(fn x -> Enum.min(x) end)
    
    find_common_items(rows_max, columns_min)
    |> get_points(rows_max, columns_min)
  end

  defp get_points([], _, _), do: []
  defp get_points([common|_], rows_max, columns_min) do
    rows_indexes = get_indexes(rows_max, common)  
    columns_indexes =  get_indexes(columns_min, common)

    for row <- rows_indexes, column <- columns_indexes, do: {row, column}
  end

  defp get_indexes(list, common) do
    list
    |> Enum.with_index
    |> Enum.reduce([], fn {x, i}, acc -> if x == common, do: acc ++ [i], else: acc end)
  end

  defp find_common_items(rows, columns) do
    MapSet.intersection(MapSet.new(rows), MapSet.new(columns))
    |> MapSet.to_list
  end

  defp trans([[] | _]), do: []
  defp trans(list), do: [Enum.map(list, &hd/1) | trans(Enum.map(list, &tl/1))]
end

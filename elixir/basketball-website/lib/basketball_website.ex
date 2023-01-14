defmodule BasketballWebsite do
  def extract_from_path(data, path), do: my_get_in(data, path_as_list(path))

  defp my_get_in(data, []), do: data
  defp my_get_in(data, [h|t]) do
    data
    |> Access.get(h)
    |> my_get_in(t)
  end

  def get_in_path(data, path), do: get_in(data, path_as_list(path))

  defp path_as_list(path), do: String.split(path, ".")
end

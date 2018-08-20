defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)
  def search(numbers, key, index, index) when elem(numbers, index) == key, do: {:ok, index}
  def search(_, _, index, index), do: :not_found
  def search(_, _, from, to) when to < from, do: :not_found
  def search(numbers, key, from, to) do
    index = (to + from) / 2 |> round
    value = elem(numbers, index)
    if key == value do
      {:ok, index}
    else
      if key > value do
        search(numbers, key, index + 1, to)
      else
        search(numbers, key, 0, index - 1)
      end
    end
  end
end

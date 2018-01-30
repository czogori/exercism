defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t}
  def generate(_, 0), do: {:ok, []}
  def generate(coins, target) when target < 0, do: {:error, "cannot change"}
  def generate([h|_], target) when target < h, do: {:error, "cannot change"}
  def generate(coins, target) do
    sorted = coins |> Enum.sort(&(&1 >= &2))
    res = _generate(sorted, target)
    case res do
      :error -> {:error, "cannot change"}
      _ -> 
         r = for n <- 1..Enum.count(coins), do: _generate(Enum.drop(sorted, n), target)
        {:ok, get_min(r, res)}
    end
  end

  def _generate(coins, target, acc \\ [])
  def _generate([], 0, acc), do: acc
  def _generate([], target, acc) when target > 0, do: :error
  def _generate([], _, acc) when is_list(acc) !== true, do: :error
  def _generate([h|t], target, acc) when target - h == 0, do: _generate([h|t], target - h, [h] ++ acc)
  def _generate([h|t], target, acc) do
    diff = target - h
    rest? = if(Enum.count(t) > 0, do: Enum.min(t) <= diff, else: true)
    if (diff > 0 && rest?) do
      _generate([h|t], diff, [h] ++ acc)
    else
      _generate(t, target, acc)
    end
  end

  def get_min([], acc), do: acc
  def get_min([h|t], acc) when h == :error, do: get_min(t, acc)
  def get_min([h|t], acc) do
    if(length(h) < length(acc), do: get_min(t, h), else: get_min(t, acc))
  end
end

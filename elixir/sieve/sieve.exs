defmodule Sieve do
  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    limit
    |> build()
    |> numbers(limit)
    |> Enum.filter(&match?({_, :unmarked}, &1))
    |> Enum.map(fn {n, _} -> n end)
    |> Enum.sort()
  end

  defp numbers(items, limit, n \\ 2) do
    if n > :math.sqrt(limit) do
      items
    else
      mark(items, n, n, limit)
      |> numbers(limit, n + 1)
    end
  end

  defp mark(items, n, acc, limit) when acc + n <= limit do
    Map.put(items,acc + n, :marked)
    |> mark(n, acc + n, limit)
  end
  defp mark(items, _, _, _), do: items

  defp build(limit) do
    for i <- 2..limit, into: %{}, do: {i, :unmarked}
  end
end

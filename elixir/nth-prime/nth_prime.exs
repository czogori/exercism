defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "error"
  def nth(1), do: 2
  def nth(2), do: 3
  def nth(count, n \\ 2, num \\ 4) do
    if count == n do
       num - 1
    else
     nth(count, (if is_prime(num), do: n + 1, else: n), num + 1)
    end
  end

  defp is_prime(2), do: true
  defp is_prime(num, div \\ 2)
  defp is_prime(num, div) when num - 1 == div, do: true
  defp is_prime(num, div), do: if(rem(num, div) == 0, do: false, else: is_prime(num, div + 1))

end

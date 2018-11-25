defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number, candidate \\ 2)
  def factors_for(1, _), do: []
  def factors_for(2, _), do: [2]
  def factors_for(3, _), do: [3]
  def factors_for(number, candidate) when number > 3 do
    if rem(number, candidate) == 0 do
      n = div(number, candidate)
      [candidate | factors_for(n)]
    else
      factors_for(number, candidate + 1)
    end
  end
end
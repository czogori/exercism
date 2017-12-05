defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number < 1 or number > 64, do:
    { :error, "The requested square must be between 1 and 64 (inclusive)" }
  def square(1), do: {:ok, 1}
  def square(number) do
    {:ok, res} = square(number - 1)
    {:ok, res * 2}
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    sum = 1..64
    |> Enum.map(&Grains.square/1) 
    |> Enum.map(fn {:ok, x} -> x end) 
    |> Enum.sum

    {:ok, sum}
  end
end

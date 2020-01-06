defmodule Allergies do
  use Bitwise

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(0), do: []
  def list(flags) do
    [1,2,4,8,16,32,64,128]
    |> Enum.filter(&(flags &&& &1) != 0)
    |> Enum.map(&map/1)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    item in list(flags)
  end

  defp map(1), do: "eggs"
  defp map(2), do: "peanuts"
  defp map(4), do: "shellfish"
  defp map(8), do: "strawberries"
  defp map(16), do: "tomatoes"
  defp map(32), do: "chocolate"
  defp map(64), do: "pollen"
  defp map(128), do: "cats"
end

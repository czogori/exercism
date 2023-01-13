defmodule ResistorColorTrio do

  @map [
    black:  0,
    brown:  1,
    red:    2,
    orange: 3,
    yellow: 4,
    green:  5,
    blue:   6,
    violet: 7,
    grey:   8,
    white:  9
  ]

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([first, second, third]) do
    [first, second]
    |> Enum.map(& @map[&1])
    |> Enum.join()
    |> Kernel.<>(zeros(third))
    |> result_with_unit()
  end

  @spec zeros(color :: atom) :: String.t()
  defp zeros(color) do
    0
    |> List.duplicate(@map[color])
    |> Enum.join()
  end

  @threeZeros "000"
  @spec result_with_unit(value :: String.t()) :: {non_neg_integer(), atom()}
  defp result_with_unit(value) do
    {result, unit} = case String.contains?(value, @threeZeros) do
      true -> {String.trim_trailing(value, @threeZeros), :kiloohms}
      false -> {value, :ohms}
    end

    {String.to_integer(result), unit}
  end
end

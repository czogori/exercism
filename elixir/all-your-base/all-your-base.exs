defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert([], _base_a, _base_b), do: nil
  def convert(_digits, _base_a, 0), do: nil
  def convert(_digits, base_a, base_b) when base_a <= 1 or base_b <= 1, do: nil
  def convert(digits, base_a, base_b) do
    cond do
      Enum.max(digits) >= base_a -> nil
      Enum.min(digits) < 0       -> nil
      true -> new_base_to_decimal(digits, base_a)|> decimal_to_new_base(base_b)
    end
  end

  def decimal_to_new_base(number, new_base, new_number \\ []) do
    rest = round(Float.floor(number / new_base))
    build_new_number = new_number ++ [rem(number, new_base)]
    if rest == 0 do
      build_new_number |> Enum.reverse
    else
      decimal_to_new_base(rest, new_base, build_new_number)
    end
  end

  def new_base_to_decimal([], _base), do: 0
  def new_base_to_decimal([h|t], base) do
    round(h * :math.pow(base, Enum.count([h|t]) - 1)) + new_base_to_decimal(t, base)
  end
end

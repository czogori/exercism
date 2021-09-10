defmodule KitchenCalculator do

  @map %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }
  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, @map[unit] * volume}

  def from_milliliter({_, volume}, unit), do: {unit, volume / @map[unit]}

  def convert({unit_from, volume}, unit_to), do: {unit_to, volume / (@map[unit_to] / @map[unit_from])}
end

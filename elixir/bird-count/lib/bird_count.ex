defmodule BirdCount do

  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  def has_day_without_birds?(list), do: Enum.member?(list, 0)

  def total(list), do: Enum.sum(list)

  @number_birds_in_busy_day 5
  def busy_days(list) do
    list
    |> Enum.filter(& &1 >= @number_birds_in_busy_day)
    |> Enum.count()
  end
end

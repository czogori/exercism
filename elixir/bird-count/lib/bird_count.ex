defmodule BirdCount do

  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0|_]), do: true
  def has_day_without_birds?([_|rest]), do: has_day_without_birds?(rest)

  def total(list, sum \\ 0)
  def total([], sum), do: sum
  def total([today | rest], sum), do: total(rest, sum + today)

  @number_birds_in_busy_day 5
  def busy_days(list, count \\ 0)
  def busy_days([], count), do: count
  def busy_days([today | rest], count) when today >= @number_birds_in_busy_day, do: busy_days(rest, count + 1)
  def busy_days([_ | rest], count), do: busy_days(rest, count)
end

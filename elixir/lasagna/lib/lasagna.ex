defmodule Lasagna do

  @oven_time 40

  def expected_minutes_in_oven, do: @oven_time

  def remaining_minutes_in_oven(minutes), do: expected_minutes_in_oven() - minutes

  def preparation_time_in_minutes(number_of_layers), do: number_of_layers * 2

  def total_time_in_minutes(number_of_layers, minutes), do: preparation_time_in_minutes(number_of_layers) + minutes

  def alarm, do: "Ding!"
end

defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{year, month, day}, {hours, minutes, seconds}} = date_time) do
    date_time
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.+(1000_000_000)
    |> :calendar.gregorian_seconds_to_datetime
  end
end

defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @days %{
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }
  @days_count 7
  @teenth 13

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :teenth) do
      offset(year, month, weekday, @teenth)
  end

  def meetup(year, month, weekday, :first) do
    offset(year, month, weekday, 1)
  end

  def meetup(year, month, weekday, :second) do
      {_, _, day } = meetup(year, month, weekday, :first)
      offset(year, month, weekday, day + 1)
  end

  def meetup(year, month, weekday, :third) do
      {_, _, day } = meetup(year, month, weekday, :second)
      offset(year, month, weekday, day + 1)
  end

  def meetup(year, month, weekday, :fourth) do
      {_, _, day } = meetup(year, month, weekday, :third)
      offset(year, month, weekday, day + 1)
  end

  def meetup(year, month, weekday, :last) do
    {year, month, day } = meetup(year, month, weekday, :fourth)
    case offset(year, month, weekday, day + 1) do
      {year, month, day } -> {year, month, day }
      {:error, :invalid_date} -> {year, month, day }
    end
  end

  defp offset(year, month, weekday, offset) do
    {:ok, date} = Date.new(year, month, offset)
      day = Date.day_of_week(date)
      off = if @days[weekday] < day do
        @days_count + @days[weekday] - day
      else
        @days[weekday] - day
      end

      case Date.new(year, month, offset + off) do
        {:ok, date} -> Date.to_erl(date)
        {:error, :invalid_date} -> {:error, :invalid_date}
      end
  end
end

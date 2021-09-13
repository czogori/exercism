defmodule LibraryFees do

  @day_in_seconds 60 * 60 * 24

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.add(days * @day_in_seconds, :second)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    c = Date.compare(planned_return_date, actual_return_date)

    if c in [:gt, :eq], do: 0, else: Date.diff(actual_return_date, planned_return_date)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = checkout
    |> datetime_from_string()
    |> return_date()

    return_datetime = datetime_from_string(return)

    late = days_late(checkout_date, return_datetime) * rate

    if monday?(return_datetime) do
      Float.floor(late / 2)
    else
      late
    end
  end
end

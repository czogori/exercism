defmodule FreelancerRates do

  @daily_rate 8
  @billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_rate * 1.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> FreelancerRates.daily_rate()
    |> Kernel.*(@billable_days)
    |> FreelancerRates.apply_discount(discount)
    |> Float.ceil()
    |> round()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / (FreelancerRates.monthly_rate(hourly_rate, discount) / @billable_days) |> Float.floor(1)
  end
end

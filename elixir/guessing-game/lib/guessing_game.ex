defmodule GuessingGame do
  def compare(_), do: "Make a guess"
  def compare(_, guess) when not is_integer(guess), do: "Make a guess"
  def compare(secret_number, secret_number), do: "Correct"
  def compare(secret_number, guess) when guess == secret_number - 1 or guess == secret_number + 1, do: "So close"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
end

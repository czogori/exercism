defmodule Wordy do
  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t()) :: integer
  def answer("What is" <> sentence) do
    sentence
    |> String.trim_trailing("?")
    |> String.split()
    |> parse()
  end
  def answer(_), do: raise ArgumentError

  defp parse([l | rest]) when is_binary(l), do: parse([String.to_integer(l) | rest])
  defp parse([l, operator, "by", r | rest]), do: parse([l, operator, r | rest])
  defp parse([l, operator, r | rest]) when is_integer(l) do
    result = evaluate(l, operator, String.to_integer(r))
    parse([result | rest])
  end
  defp parse([i]) when is_integer(i), do: i
  defp parse(_), do: raise ArgumentError

  defp evaluate(l, "plus", r) when is_integer(l) and is_integer(r), do: l + r
  defp evaluate(l, "minus", r) when is_integer(l) and is_integer(r), do: l - r
  defp evaluate(l, "multiplied", r) when is_integer(l) and is_integer(r), do: l * r
  defp evaluate(l, "divided", r) when is_integer(l) and is_integer(r), do: round(l / r)
end

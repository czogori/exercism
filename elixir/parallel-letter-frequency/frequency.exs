defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    letters = split_to_letters(texts)
    chunks = calculate_how_many_chunks(letters, workers)
    calculate(letters, chunks)
  end
  
  defp calculate([], _), do: %{}
  defp calculate(letters, chunks) do
    letters
    |> Enum.chunk_every(chunks)
    |> Enum.map(&count_letters_async(&1))
    |> Enum.map(fn(_) -> get_result() end)
    |> Enum.reduce(%{}, fn(map, acc) -> Map.merge(acc, map, fn(_, v1, v2) -> v1 + v2 end) end)
  end

  defp prepare(text) do
    text = text
    |> String.downcase()
    |> String.trim()

    Regex.replace(~r/[^[:alpha:]]/u, text, "")
  end

  defp count_letters(letters) do
    letters
    |> Enum.reduce(%{}, fn letter, acc -> Map.update(acc, letter, 1, & &1 + 1) end)
  end

  def count_letters_async(letters) do
    caller = self
    spawn(fn -> send(caller, count_letters(letters)) end)
  end

  defp get_result() do
    receive do
      result -> result
    end
  end

  defp split_to_letters(texts) do
    Enum.flat_map(texts, &String.split(prepare(&1), "", trim: true))
  end

  defp calculate_how_many_chunks(letters, workers) do
    Float.ceil(Enum.count(letters) / workers) |> round
  end
end

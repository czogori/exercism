defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """

  @letters ~w(A B C D E F)

  @spec build_shape(char) :: String.t()
  def build_shape(?A), do: "A\n"
  def build_shape(letter) do
    letter = <<letter>>
    letters_with_index = @letters |> Enum.with_index
    max_index = Enum.find_index(@letters, &(&1 == letter))
    letters = Enum.slice(letters_with_index, 0..max_index)
    letters_reverse = letters_with_index
    |> Enum.slice(0..max_index-1)
    |> Enum.reverse

    Enum.concat(letters, letters_reverse)
    |> Enum.reduce("", fn {letter, index}, acc ->
       acc <> build_row(letter, index, max_index)
    end)
  end

  defp build_row("A" = letter, index, max_index) do
    spaces = String.duplicate(" ", max_index - index)
    spaces <> letter <> spaces <> "\n"
  end
  defp build_row(letter, index, max_index) do
    spaces = String.duplicate(" ", max_index - index)
    spaces <> letter
    <> String.duplicate(" ", index * 2 - 1)
    <> letter <> spaces <> "\n"
  end
end

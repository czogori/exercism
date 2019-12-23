defmodule Atbash do
  @plain  ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9)
  @cipher ~w(z y x w v u t s r q p o n m l k j i h g f e d c b a 1 2 3 4 5 6 7 8 9)

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[^a-z1-9]/, "")
    |> String.codepoints()
    |> Enum.map(&map_letter/1)
    |> group()
    |> Enum.join()
    |> String.trim()
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.codepoints()
    |> Enum.map(&map_letter/1)
    |> Enum.join()
  end

  defp map_letter(letter) do
    Enum.zip(@plain, @cipher)
    |> Enum.into(%{})
    |> Map.get(letter)
  end

  defp group(letters, count \\ 1)
  defp group([], _), do: []
  defp group([h|t], count) when rem(count, 5) == 0, do: [h <> " " | group(t, count + 1)]
  defp group([h|t], count), do: [h | group(t, count + 1)]
end

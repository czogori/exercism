defmodule SimpleCipher do
  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  def encode(plaintext, key) do
    alg(plaintext, key, :encode)
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key) do
    alg(ciphertext, key, :decode)
  end

  defp alg(text, key, action) do
    text_len = String.length(text)
    key_len = String.length(key)

    key = prepare_key({text, text_len}, {key, key_len})
    |> String.to_charlist()

    keys = shift(key)

    text
    |> String.to_charlist()
    |> calc(keys, action)
    |> List.to_string()
  end

  defp calc([], [], _), do: []
  defp calc([h|t], [kh|kt], :encode)
    when h >= ?a and h <= ?z, do: [normalize(h + kh) | calc(t, kt, :encode)]
  defp calc([h|t], [kh|kt], :decode)
    when h >= ?a and h <= ?z, do: [normalize(h - kh) | calc(t, kt, :decode)]
  defp calc([h|t], [_|kt], action), do: [h | calc(t, kt, action)]

  defp shift([]), do: []
  defp shift([h|t]), do: [h - ?a | shift(t)]

  defp prepare_key({t, t_len}, {k, k_len}) when t_len > k_len do
    n = :math.ceil(t_len / k_len) |> round()
    new_key = String.duplicate(k, n)
    prepare_key({t, t_len}, {new_key, String.length(new_key)})
  end
  defp prepare_key({_, t_len}, {k, k_len})
    when t_len < k_len, do: binary_part(k, 0, t_len)
  defp prepare_key(_, {key, _}), do: key

  defp normalize(n) when n < ?a, do: ?z - (?a - n) + 1
  defp normalize(n) when n > ?z, do: ?a + (n - ?z) - 1
  defp normalize(n), do: n
end

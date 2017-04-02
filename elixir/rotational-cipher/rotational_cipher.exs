defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift), do: text |> :binary.bin_to_list |> Enum.map(fn n -> do_rotate(n, shift) end) |> to_string
  def do_rotate(int, shift) when (int >= ?A and int <= ?Z) or (int >= ?a and int <= ?z), do: check_boundary(int + shift, int)
  def do_rotate(int, shift), do: int
  def check_boundary(int, base) when base >= ?A and base <= ?Z and int > ?Z, do: ?A + (int - ?Z - 1)
  def check_boundary(int, base) when base >= ?a and base <= ?z and int > ?z, do: ?a + (int - ?z - 1)
  def check_boundary(int, base), do: int
end


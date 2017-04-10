defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise
  @spec commands(code :: integer) :: list(String.t())
  def commands(0), do: []
  def commands(code) do
    list = if((code &&& 1) == 1, do: ["wink"], else: [])
    list = if((code &&& 2) == 2, do: list ++ ["double blink"], else: list)
    list = if((code &&& 4) == 4, do: list ++ ["close your eyes"], else: list)
    list = if((code &&& 8) == 8, do: list ++ ["jump"], else: list)
    list = if((code &&& 16) == 16, do: Enum.reverse(list), else: list)
  end
end


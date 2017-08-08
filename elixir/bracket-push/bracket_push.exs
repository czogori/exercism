defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    only_brackets = String.replace(str, ~r/[^{}()\[\]]/, "")
    s = String.replace(only_brackets, ~r/(\{\}|\[\]|\(\))/, "")
    if s == str do
      if String.length(only_brackets) > 0 do false else true end
    else
      check_brackets(s)
    end
  end
end

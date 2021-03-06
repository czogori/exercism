defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([n | t], fun), do: if(fun.(n), do: [n | keep(t, fun)], else: keep(t, fun))
  def keep([], fun), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([n | t], fun), do: if(fun.(n), do: discard(t, fun), else: [n | discard(t, fun)])
  def discard([], fun), do: []
end


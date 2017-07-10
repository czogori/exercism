defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a),  do: :equal
  def compare(a, []) when length(a) > 0, do: :superlist
  def compare([], b) when length(b) > 0, do: :sublist
  def compare(a, b) when length(a) >= length(b), do: if contains(b, a), do: :superlist, else: :unequal
  def compare(a, b) when length(a) < length(b), do: if contains(a,b), do: :sublist, else: :unequal
  def contains(_, []), do: false
  def contains([h|t], b) do
    index = Enum.find_index(b, fn n -> n === h end)
    if index != nil do
      len = length([h|t]) -1
      if [h|t] == Enum.slice(b, index..(index + len)) do
        true
      else
        contains([h|t], Enum.slice(b, (index+1)..(length(b)-1)))
      end
    else
      false
    end
  end
end

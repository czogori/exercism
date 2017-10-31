defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @student_names [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]
  @plants %{"V" => :violets, "R" => :radishes, "C" => :clover, "G" => :grass}

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @student_names) do
    [a,b] = info_string |> String.split("\n")
    parse(String.codepoints(a), String.codepoints(b), Enum.sort(student_names))
  end

  defp parse(_, _, []), do: %{}
  defp parse([], [], [student | rest_students]), do: 
    Map.merge(%{student => {}}, parse([],[], rest_students))
  defp parse([a,b | t1], [c,d | t2], [student | rest_students]), do: 
    Map.merge(%{student => {@plants[a], @plants[b], @plants[c], @plants[d]}}, parse(t1, t2, rest_students))
end

defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[DEBUG|INFO|WARNING|ERROR].*/

  def split_line(line), do: Regex.split(~r/\<[=~*-]*\>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end-of-line[0-9]+/i, line, "")

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+(\S+)/u, line) do
      [_, user_name] -> "[USER] #{user_name} " <> line 
      _ -> line
    end
  end
end

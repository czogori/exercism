defmodule NameBadge do
  def print(nil, name, department), do: "#{name} - #{parse_department(department)}"
  def print(id, name, department), do: "[#{id}] - #{name} - #{parse_department(department)}"

  defp parse_department(nil), do: "OWNER"
  defp parse_department(department), do: String.upcase(department)
end

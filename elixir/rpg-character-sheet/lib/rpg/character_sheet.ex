defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts "Welcome! Let's fill out your character sheet together."

  def ask_name(), do: gets_and_trim("What is your character's name?\n")
  def ask_class(), do: gets_and_trim("What is your character's class?\n")

  def ask_level() do
    "What is your character's level?\n"
    |> gets_and_trim()
    |> String.to_integer()
  end

  def run() do
    welcome()
    {name, class, level} = {ask_name(), ask_class(), ask_level()}
    map = %{name: name, class: class, level: level}
    IO.puts("\nYour character: " <> inspect(map))
    map
  end

  defp gets_and_trim(text) do
    text
    |> IO.gets()
    |> String.trim()
  end
end

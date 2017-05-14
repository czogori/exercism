defmodule TwelveDays do
  @m [
      %{a: "first", b: "a Partridge in a Pear Tree"},
      %{a: "second", b: "two Turtle Doves"},
      %{a: "third", b: "three French Hens"},
      %{a: "fourth", b: "four Calling Birds"},
      %{a: "fifth", b: "five Gold Rings"},
      %{a: "sixth", b: "six Geese-a-Laying"},
      %{a: "seventh", b: "seven Swans-a-Swimming"},
      %{a: "eighth", b: "eight Maids-a-Milking"},
      %{a: "ninth", b: "nine Ladies Dancing"},
      %{a: "tenth", b: "ten Lords-a-Leaping"},
      %{a: "eleventh", b: "eleven Pipers Piping"},
      %{a: "twelfth", b: "twelve Drummers Drumming"}
    ]
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    %{a: first} = Enum.at(@m, number - 1)
    second = Enum.take(@m, number)
    second = Enum.reduce(second, "", fn n, acc -> n.b <> ", " <> acc end)
    second = String.trim_trailing(second, ", ")
    if number > 1 do
      second = String.replace_trailing(second, "a Partridge in a Pear Tree", "and a Partridge in a Pear Tree")
    end
    "On the #{first} day of Christmas my true love gave to me, #{second}."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    if starting_verse < ending_verse do
      verse(starting_verse) <> "\n" <> verses(starting_verse + 1, ending_verse)
    else
      verse(starting_verse)
    end
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end
end


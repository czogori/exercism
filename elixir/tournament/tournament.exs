defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """

  @pad 31

  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    body = input 
    |> remove_invalid()
    |> prepare_results()
    |> calculate_results()
    |> sort_by_points()
    |> table()
    |> convert_to_string()

    header <> body
  end

  def header(), do: String.pad_trailing("Team", @pad) <> "| MP |  W |  D |  L |  P\n"
  def table(input) do
    for {team, result} <- input do
      String.pad_trailing(team, @pad) <>
        "|  #{result[:mp]} |  #{result[:w]} |  #{result[:d]} |  #{result[:l]} |  #{result[:p]}"
    end
  end

  def prepare_results(input) do
    Enum.reduce(input, %{}, fn x,acc -> Map.merge(acc, Tournament.parse_item(acc, x)) end)
    |> Map.to_list()
  end

  def calculate_results(input) do
     Enum.map(input, fn {k,v} -> {k, parse(v)} end)
  end

  def parse_item(db, item) do
    [team_a, team_b, result] = split(item)
    %{team_a => check(db, team_a) ++ [result], team_b => check(db, team_b) ++ [opposite(result)]}
  end

  def parse(list) do
    win = Enum.count(list, fn x -> x == "win" end)
    draw = Enum.count(list, fn x -> x == "draw" end)
    loss = Enum.count(list, fn x -> x == "loss" end)

    %{
      mp: Enum.count(list),
      w:  win,
      d:  draw,
      l:  loss,
      p: win * 3 + draw
    }  
  end

  def opposite("win"), do: "loss"
  def opposite("loss"), do: "win"
  def opposite("draw"), do: "draw"

  def check(db, key), do: if(Map.has_key?(db, key), do: db[key], else: [])

  def sort_by_points(input), do: Enum.sort(input, &(elem(&1, 1)[:p] >= elem(&2,1)[:p]))

  def convert_to_string(input), do: Enum.join(input, "\n")

  def remove_invalid(input) do
    Enum.filter(input, fn x -> split(x) |> Enum.count() == 3 && valid_result(Enum.at(split(x), 2)) end)
  end

  def split(input) do
    String.split(input, ";")
  end

  def valid_result("win"), do: true
  def valid_result("draw"), do: true
  def valid_result("loss"), do: true
  def valid_result(_), do: false
end


defmodule Queens do
  @type t :: %Queens{black: {integer, integer}, white: {integer, integer}}
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  def new(), do: %Queens{black: {7, 3}, white: {0, 3}}

  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white, black) when white === black, do: raise ArgumentError
  def new(white, black), do: %Queens{black: black, white: white}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{black: {black_row, black_column}, white: {white_row, white_column}}) do
    fun = fn(row) ->
      cond do
        white_row == row -> Queens.row("W", white_column)
        black_row == row -> Queens.row("B", black_column)
        true             -> Queens.row()
      end
    end
    
    0..7 
    |> Enum.map(& &1) 
    |> Enum.reduce("", fn (row, acc) -> acc <> fun.(row) <> "\n" end) 
    |> String.trim()
  end

  def row(), do: 
    String.duplicate("_ ", 8)
    |> String.trim()

  def row(char, index), do: 
    String.duplicate("_ ", index) 
    <> char 
    <> " " 
    <> String.duplicate("_ ", 7 - index)
    |> String.trim()

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{black: {row, _}, white: {row, _}}), do: true
  def can_attack?(%Queens{black: {_, column}, white: {_, column}}), do: true
  def can_attack?(%Queens{black: {black_row, black_column}, white: {white_row, white_column}}), do:
    abs(black_row - white_row) == abs(black_column - white_column)
end

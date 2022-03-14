defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @m [-4, -3, -3, -2, -2, -1, -1, 0, 0, 1, 1, 2, 2, 3, 3, 4]

  @spec modifier(pos_integer()) :: integer()
  def modifier(score), do: Enum.at(@m, score - 3)

  @spec ability :: pos_integer()
  def ability do
    [_ | numbers] = 1..4 
      |> Enum.map(fn _ -> :rand.uniform(6) end) 
      |> Enum.sort()

    Enum.sum(numbers)
  end

  @spec character :: t()
  def character do
    ch = %DndCharacter{
      strength: ability(),
      dexterity: ability(),
      constitution: ability(),
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
    }
    
    %DndCharacter{ch | hitpoints: 10 + modifier(ch.constitution)}
  end
end

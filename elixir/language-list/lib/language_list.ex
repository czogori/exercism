defmodule LanguageList do

  @the_best_language "Elixir"

  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_|tail]), do: tail

  def first([head|_]), do: head

  def count(list), do: Enum.count(list)

  def exciting_list?(list), do: Enum.any?(list, fn lang -> lang == @the_best_language end)
end

defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    m
    |> String.split("\n")
    |> parse_line()
    |> ul()
  end

  defp parse_line([]), do: ""
  defp parse_line([h|t]) do
    h = h
    |> String.split()
    |> parse_word()
    |> underscores()
    |> hash()
    |> li()

    if !String.starts_with?(h, "<") &&
     !String.starts_with?(h, "<h2>") && 
     !String.starts_with?(h, "<h3>") && 
     !String.starts_with?(h, "<h4>") && 
     !String.starts_with?(h, "<h5>") && 
     !String.starts_with?(h, "<h6>") &&
     !String.starts_with?(h, "<li>") do
      h = h |> paragraph()
    end

    h <> parse_line(t)
  end

  defp parse_word([]), do: ""
  defp parse_word([h|t]) do
    h = h
    |> double_underscore()
    |> underscore() 
    h <> " " <> parse_word(t) |> String.trim()
  end

  defp paragraph(s), do: "<p>#{s}</p>"
  defp underscore(s), do: help(s, "_", "em")
  defp double_underscore(s), do: help(s, "__", "strong")
  defp underscores(s), do: s |> double_underscore() |> underscore()
  defp hash("# " <> s), do: _hash(s, 1)
  defp hash("## " <> s), do: _hash(s, 2)
  defp hash("### " <> s), do: _hash(s, 3)
  defp hash("#### " <> s), do: _hash(s, 4)
  defp hash("##### " <> s), do: _hash(s, 5)
  defp hash("###### " <> s), do: _hash(s, 6)
  defp hash(s), do: s
  defp _hash(s, number), do: "<h#{number}>#{s |> underscores() }</h#{number}>"
  defp li("* " <> s), do: "<li>#{s |> underscores() }</li>"
  defp li(s), do: s
  defp ul(s) do
    s
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.reverse()
    |> String.replace(">il/<", ">lu/<>il/<", global: false)
    |> String.reverse()
  end

  defp help(s, chars, element) do
    if is_bounded_a_char(s, chars) do
      "<#{element}>#{String.trim(s, chars)}</#{element}>"
    else
      s
    end
  end

  defp is_bounded_a_char(s, chars) do
    String.starts_with?(s, chars) && String.ends_with?(s, chars)
  end
end

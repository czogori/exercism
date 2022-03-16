defmodule Username do
  def sanitize([]), do: []
  def sanitize([h|t]) when h ==  ?ä, do: 'ae' ++ sanitize(t)
  def sanitize([h|t]) when h ==  ?ö, do: 'oe' ++ sanitize(t)
  def sanitize([h|t]) when h ==  ?ü, do: 'ue' ++ sanitize(t)
  def sanitize([h|t]) when h ==  ?ß, do: 'ss' ++ sanitize(t)
  def sanitize([h|t]) when (h >= ?a and h <= ?z) or h == ?_, do: [h] ++ sanitize(t)
  def sanitize([_|t]), do: sanitize(t)
end

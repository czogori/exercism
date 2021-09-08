defmodule LogLevel do

  @log [
    {:trace,   false},
    {:debug,   true},
    {:info,    true},
    {:warning, true},
    {:error,   true},
    {:fatal,   false}
  ]

  @trace 0
  @error 4
  @fatal 5

  def to_label(level, _) when level < @trace or level > @fatal, do: :unknown
  def to_label(level, legacy?) do
    {label, supported_in_legacy?} = Enum.at(@log, level)
    if !supported_in_legacy? && legacy? do
      :unknown
    else
      label
    end
  end

  def alert_recipient(@error, _), do: :ops
  def alert_recipient(@fatal, false), do: :ops
  def alert_recipient(level, true) when level < @trace or level > @fatal, do: :dev1
  def alert_recipient(level, false) when level < @trace or level > @fatal, do: :dev2
  def alert_recipient(level, legacy?) do
    if to_label(level, legacy?) == :unknown do
      :dev1
    else
      false
    end
  end
end

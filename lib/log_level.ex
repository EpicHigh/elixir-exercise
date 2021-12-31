defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      level == 0 and legacy? == false -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and legacy? == false -> :fatal
      true -> :unknown
    end
  end
  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    cond do
      to_label(level, legacy?) == :error -> :ops
      to_label(level, legacy?) == :fatal -> :ops
      to_label(level, legacy?) == :debug -> nil
      to_label(level, legacy?) == :info -> nil
      to_label(level, legacy?) == :warning -> nil
      legacy? == true -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> nil
    end
  end
end

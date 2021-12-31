defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end
  def preparation_time_in_minutes(minutes) do
    minutes * 2
  end
  def total_time_in_minutes(layer, minutes) do
    minutes + preparation_time_in_minutes(layer)
  end
  def alarm() do
    "Ding!"
  end
end

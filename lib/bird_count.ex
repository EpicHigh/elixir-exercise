defmodule BirdCount do
  @moduledoc """
  I'm an avid bird watcher that keeps track of how many birds have visited
  your garden on any given day.

  I decided to bring your bird watching to a new level and implement
  a few tools that will help you track and process the data.

  I have chosen to store the data as a list of integers.
  The first number in the list is the number of birds that visited my garden today,
  the second yesterday, and so on.
  """
  @spec today(list(number)) :: number
  @doc """
  A function that take a list of daily bird counts and return today's count.
  If the list is empty, it should return nil.
  """
  def today([]), do: nil
  def today([head | _]), do: head
  @spec increment_day_count(list(number)) :: nonempty_maybe_improper_list
  @doc """
  A function that take a list of daily bird counts and increment the today's count by 1.
  If the list is empty, return [1].
  """
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]
  @spec has_day_without_birds?(list(number)) :: boolean
  @doc """
  A function that take a list of daily bird counts.
  It should return true if there was at least one day when no birds visited the garden,
  and false otherwise.
  """
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | _]) when head == 0, do: true
  def has_day_without_birds?([_ | tail]), do: BirdCount.has_day_without_birds?(tail)
  @spec total(list(number)) :: number
  @doc """
  A function that take a list of daily bird counts and return the total number that
  visited your garden since you started collecting the data.
  """
  def total([]), do: 0
  def total([head | tail]), do: head + BirdCount.total(tail)
  @spec busy_days(list(number)) :: number
  @doc """
  A function that take a list of daily bird counts and return the number of busy days.
  """
  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + BirdCount.busy_days(tail)
  def busy_days([_ | tail]), do: BirdCount.busy_days(tail)
end

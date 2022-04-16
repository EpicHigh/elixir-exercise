defmodule LibraryFees do
  @moduledoc """
  Your librarian friend has asked you to extend her library software to automatically calculate
  late fees. Her current system stores the exact date and time of a book checkout as an ISO8601
  datetime string. She runs a local library in a small town in Ghana, which uses the GMT timezone
  (UTC +0), doesn't use daylight saving time, and doesn't need to worry about other timezones.
  """
  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  @doc """
  Given an ISO8601 datetime string, it should return a naive datetime object.
  """
  def datetime_from_string(string) do
    {:ok, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  @spec before_noon?(%{
          :calendar => any,
          :day => any,
          :hour => any,
          :microsecond => any,
          :minute => any,
          :month => any,
          :second => any,
          :year => any,
          optional(any) => any
        }) :: boolean
  @doc """
  Given a datetime object, it should return true if the datetime is before noon.
  """
  def before_noon?(datetime) do
    compartor = Time.compare(NaiveDateTime.to_time(datetime), ~T[12:00:00])

    case compartor do
      :gt -> false
      :eq -> false
      :lt -> true
    end
  end

  @spec return_date(%{
          :calendar => atom,
          :day => any,
          :hour => any,
          :microsecond => {any, any},
          :minute => any,
          :month => any,
          :second => any,
          :year => any,
          optional(any) => any
        }) :: Date.t()
  @doc """
  Given a datetime object, it should return the date of the return date.
  """
  def return_date(checkout_datetime) do
    day = 24 * 60 * 60

    if before_noon?(checkout_datetime) do
      dt = NaiveDateTime.add(checkout_datetime, 28 * day, :second)
      NaiveDateTime.to_date(dt)
    else
      dt = NaiveDateTime.add(checkout_datetime, 29 * day, :second)
      NaiveDateTime.to_date(dt)
    end
  end

  @spec days_late(
          %{:calendar => atom, :day => any, :month => any, :year => any, optional(any) => any},
          %{
            :calendar => any,
            :day => any,
            :hour => any,
            :microsecond => any,
            :minute => any,
            :month => any,
            :second => any,
            :year => any,
            optional(any) => any
          }
        ) :: integer
  @doc """
  Given a checkout datetime and a return datetime, it should return the number of days late.
  """
  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if diff > 0, do: diff, else: 0
  end

  @spec monday?(%{
          :calendar => any,
          :day => any,
          :hour => any,
          :microsecond => any,
          :minute => any,
          :month => any,
          :second => any,
          :year => any,
          optional(any) => any
        }) :: boolean
  @doc """
  Given a datetime object, it should return true if the datetime is a Monday.
  """
  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), number) :: number
  @doc """
  Given a checkout datetime, a return datetime, and the late fee, it should return the late fee
  amount.
  """
  def calculate_late_fee(checkout, return, rate) do
    checkout_dt = datetime_from_string(checkout)
    return_dt = datetime_from_string(return)
    late = days_late(return_date(checkout_dt), return_dt)
    if monday?(return_dt), do: trunc(late * (rate * 0.5)), else: late * rate
  end
end

defmodule TakeANumber do
  @moduledoc """
  An embedded system for a Take-A-Number machine. It is a very simple model.
  It can give out consecutive numbers and report what was the last number given out.
  """
  @spec start :: pid
  def start() do
    spawn(fn -> loop(0) end)
  end

  @spec loop(any) :: :stopped
  def loop(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        loop(state)

      {:take_a_number, pid} ->
        send(pid, state+1)
        loop(state+1)
      :stop ->
        :stopped
      _ ->
        loop(state)
    end
  end
end

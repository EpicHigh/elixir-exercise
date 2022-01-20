
defmodule RPG.CharacterSheet do
  @moduledoc """
  You and your friends love to play pen-and-paper role-playing games, but you noticed
  that it's difficult to get new people to join your group. They often struggle with character creation.
  They don't know where to start. To help new players out, you decided to write a small program that
  will guide them through the process.
  """
  @spec welcome :: :ok
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end
  @spec ask_name :: String.t()
  def ask_name() do
    IO.gets("What is your character's name?\n")
    |>String.trim()
  end
  @spec ask_class :: String.t()
  def ask_class() do
    IO.gets("What is your character's class?\n")
    |>String.trim()
  end
  @spec ask_level :: integer
  def ask_level() do
    IO.gets("What is your character's level?\n")
    |>String.trim()
    |>String.to_integer()
  end
  @spec run :: any
  def run() do
    welcome()
    sheet = %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level()
    }
    IO.inspect(sheet, label: "Your character")
  end
end

defmodule HighScore do
  @moduledoc """
  This module is used to keep track of the high scores for the most popular game
  in your local arcade hall.
  """
  @spec new :: %{}
  @doc """
  Take any arguments and returns a new, empty map of high scores.
  """
  def new() do
    %{}
  end

  @spec add_player(map, keyword, integer) :: map
  @doc """
  Add a player to the high scores.
  """
  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  @spec remove_player(map, keyword) :: map
  @doc """
  Remove a player from the high scores.
  """
  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  @spec reset_score(map, keyword) :: map
  @doc """
  Reset a player's score to 0.
  """
  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  @spec update_score(map, keyword, integer) :: map
  @doc """
  Update a player's score by adding the given amount.
  """
  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn existing_value -> existing_value + score end)
  end

  @spec get_players(map) :: list
  @doc """
  Get a list of all players in the high scores.
  """
  def get_players(scores) do
    Map.keys(scores)
  end
end

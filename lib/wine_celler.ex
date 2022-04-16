defmodule WineCellar do
  @moduledoc """
  You are the manager of a fancy restaurant that has a sizable wine cellar.
  A lot of your customers are demanding wine enthusiasts. Finding the right
  bottle of wine for a particular customer is not an easy task.

  As a tech-savvy restaurant owner, you decided to speed up the wine selection
  process by writing an app that will let guests filter your wines by their preferences.
  """
  def explain_colors do
    # Please implement the explain_colors/0 function
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  @spec filter(keyword, atom, any) :: list
  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |>filter_by_year(opts[:year])
    |>filter_by_country(opts[:country])
  end

  defp filter_by_year(wines, nil), do: wines
  defp filter_by_country(wines, nil), do: wines

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []
  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end
  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []
  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

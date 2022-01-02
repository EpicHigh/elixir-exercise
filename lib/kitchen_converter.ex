defmodule KitchenCalculator do
  @moduledoc """

  """
  @spec get_volume({atom, integer}) :: integer
  @doc """
  Given a volume-pair tuple, it should return just the numeric component.
  """
  def get_volume({_, volume} = _volume_pair) do
    volume
  end
  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, any}
  @doc """
  Given a volume-pair tuple, it should convert the volume to milliliters using the conversion chart.
  """
  def to_milliliter({:milliliter, _volume} = volume_pair) do
    volume_pair
  end
  def to_milliliter({:cup, volume} = _volume_pair) do
    {:milliliter, volume * 240}
  end
  def to_milliliter({:fluid_ounce, volume} = _volume_pair) do
    {:milliliter, volume * 30}
  end
  def to_milliliter({:teaspoon, volume} = _volume_pair) do
    {:milliliter, volume * 5}
  end
  def to_milliliter({:tablespoon, volume} = _volume_pair) do
    {:milliliter, volume * 15}
  end
  @spec from_milliliter({any, integer}, :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  @doc """
  Given a volume-pair tuple and the desired unit, it should convert the volume to the desired unit
  using the conversion chart.
  """
  def from_milliliter({_, volume} = _volume_pair, :milliliter = _unit) do
    {:milliliter, volume}
  end
  def from_milliliter({_, volume} = _volume_pair, :cup = _unit) do
    {:cup, volume / 240}
  end
  def from_milliliter({_, volume} = _volume_pair, :fluid_ounce = _unit) do
    {:fluid_ounce, volume / 30}
  end
  def from_milliliter({_, volume} = _volume_pair, :teaspoon = _unit) do
    {:teaspoon, volume / 5}
  end
  def from_milliliter({_, volume} = _volume_pair, :tablespoon = _unit) do
    {:tablespoon, volume / 15}
  end
  @spec convert({atom, integer}, atom) :: {atom, float}
  @doc """
  Given a volume-pair tuple and the desired unit
  """
  def convert({convert_unit, volume} = _volume_pair, unit) when convert_unit === unit, do: {unit, volume}
  def convert(volume_pair, unit) do
    volume_pair
    |>KitchenCalculator.to_milliliter
    |>KitchenCalculator.from_milliliter(unit)
  end
end

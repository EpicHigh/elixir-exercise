defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  Provides a simple method for dealing with cards.
  """
  @spec create_deck :: list(String.t())
  @doc """
  Create a list of cards.
  ## Examples
      iex> Cards.create_deck()
      [
        "Ace of Spades",
        "Two of Spades",
        "Three of Spades",
        "Four of Spades",
        "Five of Spades",
        "Six of Spades",
        "Seven of Spades",
        "Eight of Spades",
        "Nine of Spades",
        "Ten of Spades",
        "Jack of Spades",
        "Queen of Spades",
        "King of Spades",
        "Ace of Clubs",
        "Two of Clubs",
        "Three of Clubs",
        "Four of Clubs",
        "Five of Clubs",
        "Six of Clubs",
        "Seven of Clubs",
        "Eight of Clubs",
        "Nine of Clubs",
        "Ten of Clubs",
        "Jack of Clubs",
        "Queen of Clubs",
        "King of Clubs",
        "Ace of Hearts",
        "Two of Hearts",
        "Three of Hearts",
        "Four of Hearts",
        "Five of Hearts",
        "Six of Hearts",
        "Seven of Hearts",
        "Eight of Hearts",
        "Nine of Hearts",
        "Ten of Hearts",
        "Jack of Hearts",
        "Queen of Hearts",
        "King of Hearts",
        "Ace of Diamonds",
        "Two of Diamonds",
        "Three of Diamonds",
        "Four of Diamonds",
        "Five of Diamonds",
        "Six of Diamonds",
        "Seven of Diamonds",
        "Eight of Diamonds",
        "Nine of Diamonds",
        "Ten of Diamonds",
        "Jack of Diamonds",
        "Queen of Diamonds",
        "King of Diamonds"
      ]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  @spec shuffle_deck(list(String.t())) :: list(String.t())
  @doc """
  Shuffle the given `deck`.
  ## Examples
      iex> Cards.shuffle_deck(Cards.create_deck())
      [
        "Four of Clubs",
        "King of Clubs",
        "Eight of Diamonds",
        "Three of Clubs",
        "Eight of Spades",
        "Eight of Clubs",
        "King of Spades",
        "Ten of Clubs",
        "Six of Spades",
        "Four of Hearts",
        "Queen of Hearts",
        "Ace of Diamonds",
        "Four of Spades",
        "Nine of Spades",
        "Seven of Spades",
        "Six of Diamonds",
        "Five of Diamonds",
        "Jack of Spades",
        "Seven of Hearts",
        "Nine of Hearts",
        "Two of Spades",
        "Ten of Hearts",
        "Nine of Clubs",
        "Four of Diamonds",
        "Ace of Hearts",
        "Queen of Clubs",
        "Six of Hearts",
        "King of Hearts",
        "Two of Clubs",
        "Seven of Diamonds",
        "Queen of Spades",
        "Three of Spades",
        "Six of Clubs",
        "Eight of Hearts",
        "Ace of Spades",
        "King of Diamonds",
        "Jack of Clubs",
        "Ten of Diamonds",
        "Two of Hearts",
        "Five of Spades",
        "Two of Diamonds",
        "Queen of Diamonds",
        "Seven of Clubs",
        "Ten of Spades",
        "Five of Clubs",
        "Jack of Hearts",
        "Jack of Diamonds",
        "Three of Hearts",
        "Ace of Clubs",
        "Three of Diamonds",
        "Nine of Diamonds",
        "Five of Hearts"
      ]
  """
  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end
  @spec contains?(list(String.t()), String.t()) :: boolean
  @doc """
  Check the given `card` contains in the deck.
  ### Examples
      iex> Cards.contains?(Cards.create_deck(), "Joker")
      false
      iex> Cards.contains?(Cards.create_deck(), "Nine of Diamonds")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  @spec deal(list(String.t()), integer) :: list(String.t())
  @doc """
  Return the cards following the given `hand_size`.
  """
  def deal(deck, hand_size) do
    { hand, _rest_of_deck } = Enum.split(deck, hand_size)
    hand
  end
  @spec save(list(String.t()), String.t()) :: :ok | {:error, atom}
  @doc """
  Save the given `deck` to the given `file_name`.
  ### Examples
      iex> Cards.save(Cards.create_deck(), "deck.txt")
      :ok
  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end
  @spec load(String.t()) :: String.t()
  @doc """
  Load the given binary `file_name` and return the readable output.
  ### Examples
      iex> Cards.load("deck")
      "That file does not exist."
  """
  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist."
    end
  end

  @spec create_hand(integer) :: list(String.t())
  def create_hand(hand_size) do
    # Pipe operator: the first argument of all method should be consistent.
    Cards.create_deck
    |> Cards.shuffle_deck
    |> Cards.deal(hand_size)
  end
end

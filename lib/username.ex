defmodule Username do
  @moduledoc """
  You are working as a system administrator for a big company in Munich, Germany.
  One of your responsibilities is managing email accounts.

  You have been hearing complaints from people saying they are unable to write emails to Mr. Müller.
  You quickly realize that most of the company uses an old email client that doesn't recognize
  müller@firma.de as a valid email address because of the non-Latin character.

  Telling people to give up their favorite old email client is a lost battle,
  so you decide to create sanitized aliases for all email accounts.
  """
  @spec sanitize(charlist) :: charlist
  @doc """
  Accept a username as a charlist and return the username with all characters
  but lowercase letters removed.
  """
  def sanitize('') do
    ''
  end
  def sanitize([first_letter | rest_letters]) do
    case first_letter do
      ?_ -> [first_letter] ++ sanitize(rest_letters)
      first_letter when first_letter >= 97 and first_letter <= 122 -> [first_letter] ++ Username.sanitize(rest_letters)
      ?ß -> 'ss' ++ sanitize(rest_letters)
      ?ä -> 'ae' ++ sanitize(rest_letters)
      ?ö -> 'oe' ++ sanitize(rest_letters)
      ?ü -> 'ue' ++ sanitize(rest_letters)
      _ -> sanitize(rest_letters)
    end
  end
end

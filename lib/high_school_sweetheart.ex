defmodule HighSchoolSweetheart do
  @moduledoc """
  I am going to help high school sweethearts profess their love on social media
  by generating an ASCII heart with their initials:
  """
  @doc """
  Take a name and return its first letter.
  It should clean up any unnecessary whitespace from the name.
  """
  def first_letter(name) do
    name
    |>String.trim
    |>String.first
  end
  @doc """
  Take a name and return its first letter, uppercase,
  followed by a dot. Make sure to reuse HighSchoolSweetheart.first_letter/1
  """
  def initial(name) do
    name
    |>String.upcase
    |>HighSchoolSweetheart.first_letter
    |>Kernel.<>(".")
  end
  @doc """
  Take a full name, consisting of a first name and a last name
  separated by a space, and return the initials.
  """
  def initials(full_name) do
    [name, surname] = String.split(full_name)
    "#{HighSchoolSweetheart.initial(name)} #{HighSchoolSweetheart.initial(surname)}"
  end
  @doc """
  Take two full names and return the initials
  """
  def pair(full_name1, full_name2) do
    name1 = HighSchoolSweetheart.initials(full_name1)
    name2 = HighSchoolSweetheart.initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{name1}  +  #{name2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end

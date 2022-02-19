defmodule NameBadge do
  @moduledoc """
  Employees have an ID, name, and department name.
  Employee badge labels are formatted as follows:

  "[id] - name - DEPARTMENT".
  """
  @doc """
  Take an id, name, and a department and return the badge label, with the department name in uppercase.
  When the id is missing, it print a badge without it.
  When the department is missing, assume the badge belongs to the company owner.
  """
  def print(id, name, department) do
    first_part = if id, do: "[#{id}] - ", else: ""
    last_part = if department, do: String.upcase(department), else: "OWNER"
    "#{first_part}#{name} - #{last_part}"
  end
end

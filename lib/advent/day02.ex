defmodule Advent.Day02 do
  @moduledoc """

  """

  @doc """

  """

  def qt_valid_password(passwords_string) do
    passwords_string
    |> map_format
    |> Enum.count(& valid_pass?(&1))
  end

  def map_format(password) do
    regex = ~r/(?<min>[0-9]+)-(?<max>[0-9]+)\s(?<letter>[a-z]):\s(?<pass>[a-z]+)/

    password
    |> String.split("\n")
    |> Enum.map(& Regex.named_captures(regex, &1))
    |> IO.inspect()
  end

  def old_valid_pass?(pass_map) do
    password = pass_map["pass"]
    letter = pass_map["letter"]
    min = String.to_integer(pass_map["min"])
    max = String.to_integer(pass_map["max"])

    letter_quantity =
      password
      |> String.split("")
      |> Enum.count(& &1 == letter)

    letter_quantity >= min && letter_quantity <= max
  end

  def valid_pass?(pass_map) do
    password = pass_map["pass"]
    letter = pass_map["letter"]
    first_index = String.to_integer(pass_map["min"]) - 1
    second_index = String.to_integer(pass_map["max"]) - 1

    letter_list = String.split(password, "", trim: true)

    first_letter = Enum.at(letter_list, first_index)
    second_letter = Enum.at(letter_list, second_index)

    first_letter != second_letter && (first_letter == letter || second_letter == letter)
  end
end

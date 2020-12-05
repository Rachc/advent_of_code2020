defmodule Advent.Day03 do
  @steps 3
  def count_trees(inputs) do
    inputs
    |> parser
    |> navigate(0, [])
    |> IO.inspect()
    |> Enum.filter(& &1 == "#")
    |> length()
  end

  def parser(inputString) do
    inputString
    |> String.split("\n", trim: true)
    |> Enum.map(& String.split(&1, "", trim: true))
  end

  def navigate([], _position, acc), do: acc
  def navigate([head|tail], position, acc) do
    new_position = move3(head, position)
    new_acc = acc ++ [Enum.at(head, new_position)]

    navigate(tail, new_position, new_acc)
  end

  #Refatorar isso aqui. Da pra arrancar essa função se a gente usar stream
  def move3(list, position) do
    IO.inspect(position)
    list_size = length(list)
    if position + @steps > list_size do
      position - list_size + @steps - 1 #-1 pois base 0
    else
      position + @steps
    end
  end
end

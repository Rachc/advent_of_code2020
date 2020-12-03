defmodule Advent.Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @doc """
  Search for two numbers in a list wich sum == 2020. and returns first multiplied by the second

  ## Examples

      iex> Advent.Day01.search_for_2020([2000, 99, 20])
      40000


  """

  def search_for_2020([head | tail]), do: search_for_2020(head, tail, tail)
  def search_for_2020(_element, [], []), do: []
  def search_for_2020(_element, [], [head | tail]), do: search_for_2020(head, tail, tail)

  def search_for_2020(element, [head | tail], work_list) do
    if is_sum_2020?(element, head) do
      element * head
    else
      search_for_2020(element, tail, work_list)
    end
  end

  def is_sum_2020?(first, second), do: first + second == 2020
  def is_sum_2020?(first, second, third), do: first + second + third == 2020

  def report_repair_sum_three(expenses) do
    report =
      for i <- expenses,
          j <- expenses,
          k <- expenses,
          i + j + k == 2020,
          uniq: true,
          do: i * j * k

    List.first(report)
  end
end

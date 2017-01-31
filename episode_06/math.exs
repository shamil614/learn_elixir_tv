defmodule Math do
  def sum(list) do
    sum(list, 0)
  end

  def sum([], 0), do: 0

  def sum([], total) when total > 0, do: total

  def sum(list, total) do
    [head | tail] = list
    sum(tail, total + head)
  end

  def calculate(list, fun, total \\ 0)

  def calculate([], _fun, total), do: total

  def calculate(list, fun, total) do
    [head | tail] = list
    calculate(tail, fun, fun.(head, total))
  end
end

defmodule ListHelpers do
  def reverse(list) do
    flip(list, [])
  end

  defp flip([], new_list), do: new_list

  defp flip(original_list, new_list) do
    [head | tail] = original_list
    flip(tail, [head | new_list])
  end
end

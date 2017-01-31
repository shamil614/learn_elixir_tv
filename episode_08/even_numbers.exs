defmodule EvenNumbers do
  def even(number) do
    for i <- Range.new(1, number), rem(i, 2) == 0, do: i
  end
end

defmodule StringJoin do
  def join(strings, sep) do
    for str <- strings, into: "", do: "#{sep}#{str}"
  end
end

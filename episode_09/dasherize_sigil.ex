defmodule DasherizeSigil do
  def sigil_d(content, _opts) do
    content
    |> String.split
    |> Enum.map(fn(word) ->
        String.replace(word, ~r/_/, "-")
      end
    )
  end
end


defmodule Test do
  import DasherizeSigil

  def test do
    ~d[foo_bar biz_bang]
  end
end

Stream.resource(fn -> File.open!("sample.txt") end,
  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) ->
        if String.first(data) == "d" do
          new_data = data
          |> String.replace
          |> String.capitalize
          {[new_data], file}
        else do
          {[], file}
        end
      _ -> {:halt, file}
    end
  end,
  fn file -> File.close(file) end)
|> Enum.into([])
|> IO.inspect
#IO.inspect result

#if String.first(data) == "d" do
#  new_data = data
#  |> String.replace
#  |> String.capitalize

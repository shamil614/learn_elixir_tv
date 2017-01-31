defmodule Bot do
  def call do
    receive do
      {:talk, message} ->
        message
        |> process_message
      _ ->
        IO.puts "Unknown message"
    end
    call
  end

  defp process_message(message) do
    cond do
      message == "Hi" ->
        "Hello"
      String.match?(message, ~r/time/) ->
        dt = DateTime.utc_now
        "The time is #{dt.hour}:#{dt.minute}"
      true -> "Sorry I don't understand"
    end
    |> IO.puts
  end
end

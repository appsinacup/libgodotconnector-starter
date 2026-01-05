defmodule StarterApp do
  @moduledoc """
  StarterApp documentation.
  """

  def hello do
    IO.puts("Hello from StarterApp!")
    # Try to ping Godot if the connector is running
    case GenServer.whereis(LibGodotConnector.Godot) do
      nil ->
        IO.puts("LibGodotConnector.Godot is not running.")
      pid ->
        IO.puts("LibGodotConnector.Godot is running at #{inspect(pid)}")
        case LibGodot.Driver.request(pid, "Hello Godot!", 1000) do
          {:ok, resp} -> IO.puts("Response from Godot: #{resp}")
          {:error, reason} -> IO.puts("Error from Godot: #{inspect(reason)}")
        end
    end
  end
end

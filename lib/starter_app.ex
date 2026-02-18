defmodule StarterApp do
  @moduledoc """
  StarterApp - Example application using LibGodotConnector.
  """

  @doc """
  Greets and attempts to communicate with the Godot instance.

  Returns `:ok` on success, or `{:error, reason}` if Godot is not available.
  """
  def hello do
    IO.puts("Hello from StarterApp!")

    # Try to ping Godot if the connector is running
    case GenServer.whereis(LibGodotConnector.Godot) do
      nil ->
        IO.puts("LibGodotConnector.Godot is not running.")
        {:error, :not_running}

      pid ->
        IO.puts("LibGodotConnector.Godot is running at #{inspect(pid)}")

        case LibGodot.Driver.request(pid, "Hello Godot!") do
          {:ok, resp} ->
            IO.puts("Response from Godot: #{resp}")
            :ok

          {:error, reason} ->
            IO.puts("Error from Godot: #{inspect(reason)}")
            {:error, reason}
        end
    end
  end
end

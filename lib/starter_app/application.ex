defmodule StarterApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Call the demo once shortly after boot.
      {Task, fn ->
        # Give the dependency app time to start.
        # TODO add startup event on godot to know when it's ready.
        Process.sleep(500)
        StarterApp.hello()
      end}
    ]

    opts = [strategy: :one_for_one, name: StarterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule StarterApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # You can add your own workers here
    ]

    opts = [strategy: :one_for_one, name: StarterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

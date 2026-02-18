defmodule StarterApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Call the demo 10 times then exit
      {Task,
       fn ->
         # Give the dependency app time to start.
         Process.sleep(500)

         Enum.each(1..10, fn count ->
           IO.puts("\n=== Echo #{count} of 10 ===")
           StarterApp.hello()

           # Wait a bit between echoes (except after the last one)
           if count < 10 do
             Process.sleep(1000)
           end
         end)

         IO.puts("\n=== Completed 10 echoes, exiting... ===")
         Process.sleep(500)
         System.stop(0)
       end}
    ]

    opts = [strategy: :one_for_one, name: StarterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

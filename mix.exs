defmodule StarterApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :starter_app,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StarterApp.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:lib_godot_connector, "4.5.1-4"}
    ]
  end
end

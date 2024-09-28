defmodule MiProyecto.MixProject do
  use Mix.Project

  def project do
    [
      app: :mi_proyecto,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ecto, :ecto_sql],
      mod: {MiProyecto.Application, []}
    ]
  end

  defp deps do
  [
    {:ecto_sql, "~> 3.12"},
    {:myxql, "~> 0.7.1"}  # Actualiza la versión a 0.7.1
  ]
  end
end


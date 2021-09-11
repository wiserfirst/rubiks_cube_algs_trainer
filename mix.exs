defmodule Rubiks.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  defp deps do
    []
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.migrate", "run apps/rubiks/priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"],
      "digest.clean": ["phx.digest.clean --all"],
      test: ["ecto.reset", "ecto.migrate", "test"]
    ]
  end
end

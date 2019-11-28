use Mix.Config

config :rubiks, Rubiks.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: 2,
  ssl: true

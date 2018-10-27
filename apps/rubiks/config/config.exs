use Mix.Config

config :rubiks, ecto_repos: [Rubiks.Repo]

import_config "#{Mix.env()}.exs"

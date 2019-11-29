# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
import Config

config :rubiks, ecto_repos: [Rubiks.Repo]

config :phoenix, :json_library, Jason

# General application configuration
config :rubiks_web,
  namespace: RubiksWeb,
  ecto_repos: [Rubiks.Repo]

# Configures the endpoint
config :rubiks_web, RubiksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z9PzwCv/I8KAO2SlB+BUZrxFH+gwzFPT/mbAz8tb8iYzdIPoFbQ8kkXqmH02j/zo",
  render_errors: [view: RubiksWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RubiksWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console, format: "$time $metadata[$level] $message\n"

config :rubiks_web, :generators, context_app: :rubiks

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

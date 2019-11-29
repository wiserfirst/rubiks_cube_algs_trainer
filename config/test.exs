import Config

# Configure your database
config :rubiks, Rubiks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rubiks_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rubiks_web, RubiksWeb.Endpoint,
  http: [port: 4001],
  server: false

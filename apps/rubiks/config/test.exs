use Mix.Config

# Configure your database
config :rubiks, Rubiks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rubiks_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

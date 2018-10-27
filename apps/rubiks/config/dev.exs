use Mix.Config

# Configure your database
config :rubiks, Rubiks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rubiks_dev",
  hostname: "localhost",
  pool_size: 10

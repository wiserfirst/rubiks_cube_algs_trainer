use Mix.Config

# Configure your database
config :rubiks, Rubiks.Repo,
  username: "postgres",
  password: "",
  port: 15_432,
  database: "rubiks_dev",
  hostname: "localhost",
  pool_size: 10

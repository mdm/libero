use Mix.Config

# Configure your database
config :libero, Libero.Repo,
  username: "postgres",
  password: "postgres",
  database: "libero_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :libero_web, LiberoWeb.Guardian.Implementation,
  issuer: "libero",
  secret_key: "secret"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :libero_web, LiberoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

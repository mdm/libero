# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :libero,
  ecto_repos: [Libero.Repo]

config :libero_web,
  ecto_repos: [Libero.Repo],
  generators: [context_app: :libero]

# Configures the endpoint
config :libero_web, LiberoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ONtyWHFVrz0mG7uwAIJFlyr2hPL/Cl3m0fu5BcjJgYwSdTLxpiOIneWZS53u3g+T",
  render_errors: [view: LiberoWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: LiberoWeb.PubSub,
  live_view: [signing_salt: "ZVqjd/AH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

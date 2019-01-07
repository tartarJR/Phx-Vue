# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rentit,
  ecto_repos: [Rentit.Repo]

# Configures the endpoint
config :rentit, RentitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZVMAKS3vQDg+GKbAKOI7Nwlp5m0RmM5r6o0w2pDZxw85eAg3FVgmN+DGNnsL5+s/",
  render_errors: [view: RentitWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rentit.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :solar_guitar_store,
  ecto_repos: [SolarGuitarStore.Repo]

# Configures the endpoint
config :solar_guitar_store, SolarGuitarStoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jHeMDYeUdVaWPGnE/8ZKfnsT234WgBYzcHuMAsdYITb3lTBYe0nLJmv8ch3sqOAv",
  render_errors: [view: SolarGuitarStoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SolarGuitarStore.PubSub,
  live_view: [signing_salt: "QtjQ2nWE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

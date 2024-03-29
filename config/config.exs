# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :attend,
  ecto_repos: [Attend.Repo]

# Configures the endpoint
config :attend, Attend.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V8gUrDUXfpGtS5TmQaK/A1/8B2TmuPaZfYT2eCRDzlQSYF8ns0/1T4oFAHuMyFx4",
  render_errors: [view: Attend.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Attend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

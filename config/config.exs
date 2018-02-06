# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :deals,
  ecto_repos: [Deals.Repo]

# Configures the endpoint
config :deals, DealsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SaPxEpedk3PGKZSJ6dpm6WkYAZNk+kZT1js05wjw1bmwElyaJXZUKP3SqsrFGdWn",
  render_errors: [view: DealsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Deals.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

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
config :bunsan_users,
  ecto_repos: [BunsanUsers.Repo]

config :bunsan_users_web,
  ecto_repos: [BunsanUsers.Repo],
  generators: [context_app: :bunsan_users]

# Configures the endpoint
config :bunsan_users_web, BunsanUsersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hN7HtQ7Qb9+6O6T1025NK/N6o8WQR57OQmC2Nog4NcKIOTRkwPPecOv8rgiIZYGu",
  render_errors: [view: BunsanUsersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BunsanUsers.PubSub,
  live_view: [signing_salt: "/xWu/qRG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

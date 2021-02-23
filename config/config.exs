# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vteach_phx,
  ecto_repos: [VteachPhx.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :vteach_phx, VteachPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T7sGXNOHndNXa6xx1dFjxbgms2QXWOE1gsxYpTA2TPkWxvGuALqag/Hj3tfKknxl",
  render_errors: [view: VteachPhxWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: VteachPhx.PubSub,
  live_view: [signing_salt: "rilJWl8z"]

# Configures Elixir's Logger
# config :logger, :console
  # backends: [:console],
  # format: "$time [$level] $metadata $message\n",
  # metadata: :all
  # metadata: [:module, :function, :line]
  # format: {VteachPhxWeb.LogFormatter, :format}

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian configurations for JWT token authentication
config :vteach_phx, VteachPhx.Accounts.Guardian,
       issuer: "vteach_phx",
       secret_key: "5tFzEgXJ0wLuQZPHIuZw6FZ1gmrltIGJoS6W5QLeDFmwQLPCj8tk9Tk3OHLXTXj/"
      #  secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

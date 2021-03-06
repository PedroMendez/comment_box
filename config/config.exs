# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :comment_box,
  ecto_repos: [CommentBox.Repo]

# Configures the endpoint
config :comment_box, CommentBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kTkiLTx1JiBGyzLgPNXOxh5LQR7/Gmy5UOO80709ujQZJ6wSAbzwxyFDqWWL7TUA",
  render_errors: [view: CommentBoxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CommentBox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

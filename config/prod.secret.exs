use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :y, YWeb.Endpoint,
  secret_key_base: "b5Ocfz0kjLmWmudjvQ53uxfm7UYR4OHFLV6ScW8Xee7VWYcVNIBdO1+V/7wgD80G"

# Configure your database
# config :y, Y.Repo,
# username: "postgres",
# password: "postgres",
# database: "y_prod",
# pool_size: 15
config :y, Y.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  # database: "my_app_prod",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :docs, DocsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "u4e3e+8Abr+OunouHVjC8tB6oY+VLxgJkm2/o76l4zaI+MM6BmvjY+Pyn5n9Hp/4",
  server: false

# In test we don't send emails.
config :docs, Docs.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true

import Config

config :mi_proyecto, MiProyecto.Repo,
  username: "root",
  password: "Karmaland777",
  database: "Prolog",
  hostname: "127.0.0.1",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :mi_proyecto, ecto_repos: [MiProyecto.Repo]

 

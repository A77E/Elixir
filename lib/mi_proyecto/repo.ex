defmodule MiProyecto.Repo do
  use Ecto.Repo,
    otp_app: :mi_proyecto,
    adapter: Ecto.Adapters.MyXQL
end
 

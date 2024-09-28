defmodule MiProyecto.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Inicia el repositorio de Ecto cuando la aplicación se inicie
      MiProyecto.Repo
      # Puedes agregar otros trabajadores aquí
    ]

    # Configura la estrategia de supervisión
    opts = [strategy: :one_for_one, name: MiProyecto.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


 

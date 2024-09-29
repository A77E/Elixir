# Guía para Crear un Proyecto Elixir con Ecto y MySQL

Integrantes:
- Espinoza Huerta Alejandro 
- Martinez Nava Blanca Yessenia
- America Martinez Pérez

Elixir es un lenguaje de programación funcional, concurrente y de propósito general, diseñado para construir aplicaciones escalables y mantenibles. Se ejecuta sobre la máquina virtual de Erlang (BEAM), lo que le permite aprovechar las capacidades de concurrencia y distribución de Erlang.

Ecto es una biblioteca de Elixir para interactuar con bases de datos. Proporciona una capa de abstracción sobre el acceso a datos, lo que facilita la manipulación de datos en bases de datos relacionales y no relacionales.

## 1. Crear un nuevo proyecto Elixir
Ejecuta el siguiente comando en tu terminal:
```
mix new mi_proyecto --module MiProyecto
cd mi_proyecto
```

## 2. Agregar dependencias en `mix.exs`
Abre el archivo `mix.exs` y agrega las siguientes dependencias:

```
defp deps do
  [
    {:ecto_sql, "~> 3.12"},
    {:myxql, "~> 0.7.1"}
  ]
end
```
## 3. Obtener las dependencias
Ejecuta el siguiente comando en tu terminal:

```
mix deps.get
```
## 4. Crear el archivo de configuración `config/config.exs`
Asegúrate de que tu archivo de configuración tenga la conexión a la base de datos:

```
config :mi_proyecto, MiProyecto.Repo,
  username: "tu_usuario",
  password: "tu_contraseña",
  database: "mi_proyecto_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```
## 5. Crear el repositorio
Crea un archivo `lib/mi_proyecto/repo.ex`:

```
defmodule MiProyecto.Repo do
  use Ecto.Repo,
    otp_app: :mi_proyecto,
    adapter: Ecto.Adapters.MyXQL
end
```
## 6. Crear el esquema del modelo
Crea un archivo `lib/mi_proyecto/user.ex`:

```
defmodule MiProyecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nombre, :string
    field :email, :string
    field :edad, :integer

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nombre, :email, :edad])
    |> validate_required([:nombre, :email, :edad])
  end
end
```
## 7. Crear la migración
Genera una nueva migración:

```
mix ecto.gen.migration create_users

%%Edita el archivo de migración en priv/repo/migrations/ para definir la tabla users:

defmodule MiProyecto.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nombre, :string
      add :email, :string
      add :edad, :integer

      timestamps()
    end
  end
end
```
## 8. Ejecutar la migración
Aplica las migraciones a la base de datos:

```
mix ecto.migrate
```
## 9. Insertar datos en la base de datos
Abre la consola interactiva y ejecuta:

```bash

iex -S mix

%%Luego, dentro de iex:


alias MiProyecto.Repo
alias MiProyecto.User

changeset = User.changeset(%User{}, %{nombre: "Juan", email: "juan@example.com", edad: 25})
Repo.insert(changeset)
```
## 10. Verificar los datos insertados
Para consultar los registros en la tabla users:

```
users = Repo.all(User)
IO.inspect(users)
```
## 11. Editar un registro
Para editar un registro:

```
user = Repo.get(MiProyecto.User, id)
changeset = User.changeset(user, %{nombre: "Nuevo Nombre", email: "nuevo_email@example.com", edad: 30})
Repo.update(changeset)
```
## 12. Borrar un registro
Para borrar un registro:

```
user = Repo.get(MiProyecto.User, id)
Repo.delete(user)
```
## 13. Revertir migraciones (si es necesario)
Si necesitas revertir la última migración:
```
mix ecto.rollback
```

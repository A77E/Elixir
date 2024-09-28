# Guía para Crear un Proyecto Elixir con Ecto y MyXQL

## 1. Crear un nuevo proyecto Elixir
Ejecuta el siguiente comando en tu terminal:
```bash
mix new mi_proyecto --module MiProyecto
cd mi_proyecto


`## 2. Agregar dependencias en `mix.exs`
Abre el archivo `mix.exs` y agrega las siguientes dependencias:

```elixir
defp deps do
  [
    {:ecto_sql, "~> 3.12"},
    {:myxql, "~> 0.7.1"}
  ]
end

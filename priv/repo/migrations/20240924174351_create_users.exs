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




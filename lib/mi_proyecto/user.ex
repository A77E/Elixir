# lib/mi_proyecto/user.ex
defmodule MiProyecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nombre, :string
    field :email, :string
    field :edad, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nombre, :email, :edad])
    |> validate_required([:nombre, :email, :edad])
  end
end


defmodule RocPass.Schedule.Opponent do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.Opponent


  schema "opponents" do
    field :name, :string
    field :mascot, :string
    field :logo_key, :string

    timestamps()
  end

  @doc false
  def changeset(%Opponent{} = opponent, attrs) do
    opponent
    |> cast(attrs, [:name, :mascot, :logo_key])
    |> validate_required([:name, :mascot, :logo_key])
  end
end

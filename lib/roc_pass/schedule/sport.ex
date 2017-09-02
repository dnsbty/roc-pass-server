defmodule RocPass.Schedule.Sport do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.Sport


  schema "sports" do
    field :name, :string
  end

  @doc false
  def changeset(%Sport{} = sport, attrs) do
    sport
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

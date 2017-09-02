defmodule RocPass.Schedule.Opponent do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.{
    Event,
    Opponent
  }

  schema "opponents" do
    field :name, :string, default: ""
    field :mascot, :string, default: ""
    field :logo_key, :string, default: ""

    has_many :events, Event

    timestamps()
  end

  @doc false
  def changeset(%Opponent{} = opponent, attrs) do
    opponent
    |> cast(attrs, [:name, :mascot, :logo_key])
    |> validate_required([:name, :mascot, :logo_key])
  end
end

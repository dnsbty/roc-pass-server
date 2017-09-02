defmodule RocPass.Schedule.Venue do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.{
    Event,
    Venue
  }

  schema "venues" do
    field :name, :string
    field :address, :string
    field :city, :string
    field :state, :string
    field :zip_code, :string
    field :latitude, :string
    field :longitude, :string
    field :photo_key, :string, default: ""

    has_many :events, Event

    timestamps()
  end

  @doc false
  def changeset(%Venue{} = venue, attrs) do
    venue
    |> cast(attrs, [:name, :photo_key, :address, :city, :state, :zip_code, :latitude, :longitude])
    |> validate_required([:name, :address, :city, :state, :zip_code, :latitude, :longitude])
    |> validate_length(:city, max: 30)
    |> validate_length(:state, max: 2)
    |> validate_length(:zip_code, max: 10)
    |> validate_length(:latitude, max: 12)
    |> validate_length(:longitude, max: 12)
  end
end

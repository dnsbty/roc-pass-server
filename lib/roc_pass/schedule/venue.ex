defmodule RocPass.Schedule.Venue do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.Venue


  schema "venues" do
    field :address, :string
    field :city, :string
    field :latitude, :string
    field :longitude, :string
    field :name, :string
    field :photo_key, :string
    field :state, :string
    field :zip_code, :string

    timestamps()
  end

  @doc false
  def changeset(%Venue{} = venue, attrs) do
    venue
    |> cast(attrs, [:name, :photo_key, :address, :city, :state, :zip_code, :latitude, :longitude])
    |> validate_required([:name, :photo_key, :address, :city, :state, :zip_code, :latitude, :longitude])
  end
end

defmodule RocPass.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :name, :string, null: false, default: ""
      add :photo_key, :string, null: false, default: ""
      add :address, :string, null: false, default: ""
      add :city, :string, null: false, default: "", size: 30
      add :state, :string, null: false, default: "", size: 2
      add :zip_code, :string, null: false, default: "", size: 10
      add :latitude, :string, null: false, default: "", size: 10
      add :longitude, :string, null: false, default: "", size: 10

      timestamps()
    end

  end
end

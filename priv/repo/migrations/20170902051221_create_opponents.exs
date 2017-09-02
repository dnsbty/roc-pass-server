defmodule RocPass.Repo.Migrations.CreateOpponents do
  use Ecto.Migration

  def change do
    create table(:opponents) do
      add :name, :string, null: false, default: ""
      add :mascot, :string, null: false, default: ""
      add :logo_key, :string, null: false, default: ""

      timestamps()
    end

  end
end

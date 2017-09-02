defmodule RocPass.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :start, :naive_datetime, null: false
      add :sport_id, references(:sports, on_delete: :nothing), null: false
      add :opponent_id, references(:opponents, on_delete: :nothing), null: false
      add :venue_id, references(:venues, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:events, [:sport_id])
    create index(:events, [:opponent_id])
    create index(:events, [:venue_id])
  end
end

defmodule RocPass.Repo.Migrations.AddWatchingInfo do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :is_home_game, :boolean, null: false, default: true
      add :tv_station, :string, null: false, default: ""
    end
  end
end

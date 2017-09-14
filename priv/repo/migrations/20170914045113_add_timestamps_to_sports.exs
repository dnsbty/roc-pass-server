defmodule RocPass.Repo.Migrations.AddTimestampsToSports do
  use Ecto.Migration

  def change do
    alter table(:sports) do
      timestamps default: "2017-09-13 00:00:00", null: false
    end
  end
end

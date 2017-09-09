defmodule RocPass.Repo.Migrations.AddTimeTbaToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :date_only, :boolean, null: false, default: true
    end
  end
end

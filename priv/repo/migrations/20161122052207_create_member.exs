defmodule Attend.Repo.Migrations.CreateMember do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :is_captain, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create index(:members, [:user_id])
    create index(:members, [:team_id])

  end
end

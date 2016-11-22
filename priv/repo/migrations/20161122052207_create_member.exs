defmodule Attend.Repo.Migrations.CreateMember do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :is_captain, :boolean, default: false, null: false
      add :user, references(:users, on_delete: :nothing, type: :binary_id)
      add :team, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create index(:members, [:user])
    create index(:members, [:team])

  end
end

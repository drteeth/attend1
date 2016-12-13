defmodule Attend.Repo.Migrations.CreateAttendanceRequest do
  use Ecto.Migration

  def change do
    create table(:attendance_requests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string
      add :reason, :text
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id)
      add :player_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create index(:attendance_requests, [:game_id])
    create index(:attendance_requests, [:player_id])

  end
end

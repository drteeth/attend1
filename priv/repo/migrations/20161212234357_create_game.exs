defmodule Attend.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start_time, :datetime
      add :location, :string
      add :home_team_id, references(:teams, on_delete: :nothing, type: :binary_id)
      add :away_team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create index(:games, [:home_team_id])
    create index(:games, [:away_team_id])

  end
end

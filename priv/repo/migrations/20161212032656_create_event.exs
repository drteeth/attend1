defmodule Attend.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :stream, :string
      add :event_type, :string
      add :event_id, :string
      add :data, :text
      add :metadata, :text

      timestamps()
    end

  end
end

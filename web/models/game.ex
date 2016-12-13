defmodule Attend.Game do
  use Attend.Web, :model

  schema "games" do
    field :start_time, Ecto.DateTime
    field :location, :string
    belongs_to :home_team, Attend.Team, type: :binary_id
    belongs_to :away_team, Attend.Team, type: :binary_id

    timestamps()
  end

  @required_fields [
    :start_time,
    :location,
    :home_team_id,
    :away_team_id
  ]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end

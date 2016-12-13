defmodule Attend.AttendanceRequest do
  use Attend.Web, :model

  schema "attendance_requests" do
    field :status, :string, default: "awaiting"
    field :reason, :string
    belongs_to :game, Attend.Game, type: :binary_id
    belongs_to :player, Attend.User, type: :binary_id

    timestamps()
  end

  @required_fields = [
    :game_id,
    :player_id,
    :status,
  ]

  @optional_fields = [:reason]

  def request_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:status])
  end
end

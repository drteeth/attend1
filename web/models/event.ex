defmodule Attend.Event do
  use Attend.Web, :model

  schema "events" do
    field :stream, :string
    field :event_type, :string
    field :event_id, :string
    field :data, :string
    field :metadata, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:stream, :event_type, :event_id, :data, :metadata])
    |> validate_required([:stream, :event_type, :event_id, :data, :metadata])
  end
end

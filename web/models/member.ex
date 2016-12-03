defmodule Attend.Member do
  use Attend.Web, :model

  schema "members" do
    field :is_captain, :boolean, default: false
    belongs_to :user, Attend.User, type: :binary_id
    belongs_to :team, Attend.Team, type: :binary_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:is_captain])
    |> validate_required([:is_captain])
    |> assoc_constraint(:user)
    |> assoc_constraint(:team)
  end
end

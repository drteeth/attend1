defmodule Attend.Team do
  use Attend.Web, :model
  alias Attend.Member

  schema "teams" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def add_member_changeset(team, user, is_captain \\ false) do
    # TODO handle is_captain
    params = %{ user: user, team: team }
    Member.changeset(%Member{}, params)
  end

end

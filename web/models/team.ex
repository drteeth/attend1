defmodule Attend.Team do
  use Attend.Web, :model

  schema "teams" do
    field :name, :string
    belongs_to :captain, Attend.Captain

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
end

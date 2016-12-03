defmodule Attend.ExploreTest do
  use Attend.ConnCase
  alias Attend.{Repo, User, Team, Member}
  alias Ecto.Multi

  test "a user creates a team" do
    alice = insert_user("Alice Munroe", "alice@example.com")
    bob = insert_user("Bob Ross", "bob@example.com")
    team = insert_team("The Puffins", alice)

    team = team
    Multi.new
    |> Multi.insert(:alice, Team.add_member_changeset(team, alice))
    |> Multi.insert(:bob, Team.add_member_changeset(team, bob))
    |> Repo.transaction

    # query = from m in Member,
    #         select: m,
    #         preload: [:user, :team]
    # IO.inspect Repo.all(query)
    IO.inspect Repo.all(Member)
  end

  defp insert_user(name, email) do
    params = %{ name: name, email: email }
    {:ok, user} = User.changeset(%User{}, params) |> Repo.insert
    user
  end

  defp insert_team(name, captain) do
    params = %{ name: name, captain: captain }
    {:ok, team} = Team.changeset(%Team{}, params) |> Repo.insert
    team
  end

end

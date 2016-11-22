defmodule Attend.ExploreTest do
  use Attend.ConnCase
  alias Attend.{Repo, User, Team}

  test "a user creates a team" do
    team = %Team{name: "The Puffins"}

    {:ok, alice} = %User{ name: "Alice Munroe", email: "alice@example.com" }
                   |> User.changeset
                   |> Repo.insert

    {:ok, team} = %Team{ name: "The Puffins" }
                  |> Team.changeset
                  |> Repo.insert

  end
end

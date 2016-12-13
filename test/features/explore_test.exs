defmodule Attend.ExploreTest do
  use Attend.ConnCase
  alias Attend.{
    Repo,
    User,
    Team,
    Member,
    Game,
    AttendanceRequest
  }
  alias Ecto.Multi

  defmodule UserService do

    def register(name, email) do
      params = %{name: name, email: email}
      changeset = User.changeset(%User{}, params)
      Repo.insert(changeset)
    end

  end

  defmodule TeamService do

    def register(name, captain) do
      params = %{name: name}
      changeset = Team.changeset(%Team{}, params)
      {:ok, team} = Repo.insert(changeset)
      {:ok, _} = Repo.insert(Team.add_member_changeset(team, captain))
      {:ok, team}
    end

  end

  defmodule GameService do

    def schedule_game(team1, [vs: team2, at: location, starting_at: start_date_time]) do
      params = %{
        home_team_id: team1.id,
        away_team_id: team2.id,
        start_time: start_date_time,
        location: location
      }
      changeset = Game.changeset(%Game{}, params)
      Repo.insert(changeset)
    end

    def request_attendance(game, player) do
      params = %{game: game, player: player}
      changeset = AttendanceRequest.request_changeset(%AttendanceRequest{}, params)
      Repo.insert(changeset)
    end

    def confirm_attendance(request_id, status, reason \\ nil) do
      params = %{status: status, reason: reason}
      request = Repo.get!(AttendanceRequest, request_id)

      changeset = AttendanceRequest.update_changeset(request, params)
      Repo.update(changeset)
    end
  end

  test "registering a user" do
    {:ok, alice} = UserService.register("Alice Munro", "alice@example.com")
  end

  test "a whole bunch of stuff" do
    {:ok, alice} = UserService.register("Alice Munro", "alice@example.com")
    {:ok, bob} = UserService.register("Bob Ross", "bob@example.com")
    {:ok, penguins} = TeamService.register("The Penguins", alice)
    {:ok, flames} = TeamService.register("The Flames", bob)
    {:ok, game} = GameService.schedule_game(penguins, vs: flames,
                                            at: "Monarch Park: Field 3",
                                            starting_at: ~N[2017-01-23 19:30:00])
    {:ok, alice_token} = GameService.request_attendance(game, alice)
    {:ok, bob_token} = GameService.request_attendance(game, bob)
    GameService.confirm_attendance(alice_token.id, :yes)
    GameService.confirm_attendance(bob_token.id, :maybe, "I'm a flip-flopper")

    IO.inspect(Repo.all(User))
    IO.inspect(Repo.all(Team))
    IO.inspect(Repo.all from g in Game, preload: [:home_team, :away_team])
    IO.inspect(Repo.all from m in Member, preload: [:team, :user])
    IO.inspect(Repo.all from r in AttendanceRequest, preload: [:game, :player])
    # TODO
    # GameService.cancel(game)
  end

  test "registering a team" do
    alice = insert_user("Alice Munroe", "alice@example.com")
    bob = insert_user("Bob Ross", "bob@example.com")
    team = insert_team("The Puffins", alice)

    Multi.new
    |> Multi.insert(:alice, Team.add_member_changeset(team, alice))
    |> Multi.insert(:bob, Team.add_member_changeset(team, bob))
    |> Repo.transaction
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

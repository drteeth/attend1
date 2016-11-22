defmodule Attend.MemberTest do
  use Attend.ModelCase

  alias Attend.Member

  @valid_attrs %{is_captain: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Member.changeset(%Member{}, @valid_attrs)
    assert changeset.valid?
  end

end

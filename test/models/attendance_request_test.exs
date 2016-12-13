defmodule Attend.AttendanceRequestTest do
  use Attend.ModelCase

  alias Attend.AttendanceRequest

  @valid_attrs %{reasons: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AttendanceRequest.changeset(%AttendanceRequest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AttendanceRequest.changeset(%AttendanceRequest{}, @invalid_attrs)
    refute changeset.valid?
  end
end

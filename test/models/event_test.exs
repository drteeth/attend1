defmodule Attend.EventTest do
  use Attend.ModelCase

  alias Attend.Event

  @valid_attrs %{data: "some content", event_id: "some content", event_type: "some content", metadata: "some content", stream: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end

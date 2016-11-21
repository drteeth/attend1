defmodule Attend.PageController do
  use Attend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

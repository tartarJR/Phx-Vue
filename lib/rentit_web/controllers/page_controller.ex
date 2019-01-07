defmodule RentitWeb.PageController do
  use RentitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

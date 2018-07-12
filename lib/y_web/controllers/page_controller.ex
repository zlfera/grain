defmodule YWeb.PageController do
  use YWeb, :controller

  def index(conn, _params) do
    grains = Y.Repo.all(Y.Grain)
    render(conn, "index.html", grains: grains)
  end
end

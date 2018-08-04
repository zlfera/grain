defmodule YWeb.PageController do
  use YWeb, :controller
  import Ecto.Query, only: [order_by: 2]

  def index(conn, _params) do
    grains = Y.Grain |> Ecto.Query.order_by(desc: :inserted_at) |> Y.Repo.all()
    render(conn, "index.html", grains: grains)
  end
end

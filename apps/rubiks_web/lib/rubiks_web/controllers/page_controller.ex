defmodule RubiksWeb.PageController do
  use RubiksWeb, :controller

  def index(conn, _params) do
    alg = "R U' R' d R' U2 R U R' U2 R"
    render(conn, "index.html", alg: alg)
  end
end

defmodule RubiksWeb.PageController do
  use RubiksWeb, :controller
  alias Rubiks.AlgorithmCtx

  def index(conn, _params) do
    alg = AlgorithmCtx.random_alg()
    render(conn, "index.html", alg: alg)
  end

  def show(conn, %{"id" => id}) do
    alg = AlgorithmCtx.get(id)
    render(conn, "show.html", alg: alg)
  end

  def random(conn, _params) do
    id = AlgorithmCtx.random_id()
    redirect(conn, to: page_path(conn, :show, id))
  end
end

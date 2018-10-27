defmodule RubiksWeb.PageController do
  use RubiksWeb, :controller
  alias Rubiks.AlgorithmCtx

  def index(conn, _params) do
    alg = AlgorithmCtx.random_alg()
    render(conn, "index.html", alg: alg)
  end

  def show(conn, %{"id" => text}) do
    alg = AlgorithmCtx.get_by_text(text)
    sidebar = AlgorithmCtx.sidebar_content()
    render(conn, "show.html", alg: alg, sidebar: sidebar)
  end

  def random(conn, _params) do
    id = AlgorithmCtx.random_id()
    redirect(conn, to: page_path(conn, :show, id))
  end
end

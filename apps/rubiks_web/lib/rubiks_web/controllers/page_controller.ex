defmodule RubiksWeb.PageController do
  use RubiksWeb, :controller
  alias Rubiks.AlgorithmCtx

  def index(conn, _params) do
    alg = AlgorithmCtx.random_alg()
    render(conn, "index.html", alg: alg)
  end

  def show(conn, %{"id" => text}) do
    alg = AlgorithmCtx.get_by_text(text)
    render(conn, "show.html", alg: alg)
  end
end

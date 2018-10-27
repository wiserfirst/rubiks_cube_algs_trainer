defmodule RubiksWeb.PageController do
  use RubiksWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

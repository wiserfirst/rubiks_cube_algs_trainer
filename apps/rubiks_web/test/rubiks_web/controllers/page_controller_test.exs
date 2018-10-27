defmodule RubiksWeb.PageControllerTest do
  use RubiksWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Rubik's Cube Algorithms trainer"
  end
end

defmodule LiberoWeb.AuthController do
  use LiberoWeb, :controller

  def check(conn, _params) do
    maybe_user = Guardian.Plug.current_resource(conn)
    if maybe_user do
      render(conn, "authenticated_user.json", user: maybe_user)
    else
      conn
      |> put_status(:unauthorized)
      |> render(LiberoWeb.ErrorView, "401.json")
    end
  end
end

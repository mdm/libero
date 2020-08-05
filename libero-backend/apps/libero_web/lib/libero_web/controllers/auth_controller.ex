defmodule LiberoWeb.AuthController do
  use LiberoWeb, :controller

  def check(conn, _params) do
    maybe_user = LiberoWeb.Guardian.Implementation.Plug.current_resource(conn)
    IO.inspect(maybe_user)
    if maybe_user do
      render(conn, "authenticated_user.json", user: maybe_user)
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(LiberoWeb.ErrorView)
      |> render("401.json")
    end
  end

  def login(conn, _params) do
    conn
    |> LiberoWeb.Guardian.Implementation.Plug.sign_in(:user)
    |> send_resp(:ok, "")
  end

  def logout(conn, _params) do
    conn
    |> LiberoWeb.Guardian.Implementation.Plug.sign_out()
    |> send_resp(:ok, "")
  end
end

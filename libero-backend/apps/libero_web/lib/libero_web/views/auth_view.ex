defmodule LiberoWeb.AuthView do
  use LiberoWeb, :view

  def render("authenticated_user.json", _assigns) do
    %{authenticated: true}
  end
end

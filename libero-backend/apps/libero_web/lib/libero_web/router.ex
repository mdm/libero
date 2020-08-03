defmodule LiberoWeb.Router do
  use LiberoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", LiberoWeb do
    pipe_through :api

    get "/", AuthController, :check
  end
end

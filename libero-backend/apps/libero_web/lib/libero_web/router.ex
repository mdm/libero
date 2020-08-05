defmodule LiberoWeb.Router do
  use LiberoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug AuthMe.UserManager.Pipeline
  end

  scope "/auth", LiberoWeb do
    pipe_through [:api, :auth]

    get "/", AuthController, :check
    post "/", AuthController, :login
    delete "/", AuthController, :logout
  end
end

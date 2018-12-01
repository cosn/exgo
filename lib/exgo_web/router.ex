defmodule ExGoWeb.Router do
  use ExGoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/links", ExGoWeb do
    pipe_through :api

    post "/", LinkController, :create
    get "/:id", LinkController, :show
    get "/name/:name", LinkController, :show
  end
end

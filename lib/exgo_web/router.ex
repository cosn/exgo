defmodule ExGoWeb.Router do
  use ExGoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExGoWeb do
    pipe_through :api
  end
end

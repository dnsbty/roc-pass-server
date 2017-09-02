defmodule RocPassWeb.Router do
  use RocPassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RocPassWeb do
    pipe_through :api
  end
end

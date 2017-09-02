defmodule RocPassWeb.Router do
  use RocPassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/schedule", RocPassWeb do
    pipe_through :api

    resources "/sports", SportController, except: [:new, :edit]
    resources "/venues", VenueController, except: [:new, :edit]
  end
end

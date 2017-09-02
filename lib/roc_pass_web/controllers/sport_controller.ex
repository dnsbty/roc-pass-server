defmodule RocPassWeb.SportController do
  use RocPassWeb, :controller

  alias RocPass.Schedule
  alias RocPass.Schedule.Sport

  action_fallback RocPassWeb.FallbackController

  def index(conn, _params) do
    sports = Schedule.list_sports()
    render(conn, "index.json", sports: sports)
  end

  def create(conn, %{"sport" => sport_params}) do
    with {:ok, %Sport{} = sport} <- Schedule.create_sport(sport_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sport_path(conn, :show, sport))
      |> render("show.json", sport: sport)
    end
  end

  def show(conn, %{"id" => id}) do
    sport = Schedule.get_sport!(id)
    render(conn, "show.json", sport: sport)
  end

  def update(conn, %{"id" => id, "sport" => sport_params}) do
    sport = Schedule.get_sport!(id)

    with {:ok, %Sport{} = sport} <- Schedule.update_sport(sport, sport_params) do
      render(conn, "show.json", sport: sport)
    end
  end

  def delete(conn, %{"id" => id}) do
    sport = Schedule.get_sport!(id)
    with {:ok, %Sport{}} <- Schedule.delete_sport(sport) do
      send_resp(conn, :no_content, "")
    end
  end
end

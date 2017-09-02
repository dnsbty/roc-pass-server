defmodule RocPassWeb.OpponentController do
  use RocPassWeb, :controller

  alias RocPass.Schedule
  alias RocPass.Schedule.Opponent

  action_fallback RocPassWeb.FallbackController

  def index(conn, _params) do
    opponents = Schedule.list_opponents()
    render(conn, "index.json", opponents: opponents)
  end

  def create(conn, %{"opponent" => opponent_params}) do
    with {:ok, %Opponent{} = opponent} <- Schedule.create_opponent(opponent_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", opponent_path(conn, :show, opponent))
      |> render("show.json", opponent: opponent)
    end
  end

  def show(conn, %{"id" => id}) do
    opponent = Schedule.get_opponent!(id)
    render(conn, "show.json", opponent: opponent)
  end

  def update(conn, %{"id" => id, "opponent" => opponent_params}) do
    opponent = Schedule.get_opponent!(id)

    with {:ok, %Opponent{} = opponent} <- Schedule.update_opponent(opponent, opponent_params) do
      render(conn, "show.json", opponent: opponent)
    end
  end

  def delete(conn, %{"id" => id}) do
    opponent = Schedule.get_opponent!(id)
    with {:ok, %Opponent{}} <- Schedule.delete_opponent(opponent) do
      send_resp(conn, :no_content, "")
    end
  end
end

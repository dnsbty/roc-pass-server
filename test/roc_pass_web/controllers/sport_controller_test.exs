defmodule RocPassWeb.SportControllerTest do
  use RocPassWeb.ConnCase

  alias RocPass.Schedule
  alias RocPass.Schedule.Sport

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:sport) do
    {:ok, sport} = Schedule.create_sport(@create_attrs)
    sport
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sports", %{conn: conn} do
      conn = get conn, sport_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sport" do
    test "renders sport when data is valid", %{conn: conn} do
      conn = post conn, sport_path(conn, :create), sport: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, sport_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sport_path(conn, :create), sport: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sport" do
    setup [:create_sport]

    test "renders sport when data is valid", %{conn: conn, sport: %Sport{id: id} = sport} do
      conn = put conn, sport_path(conn, :update, sport), sport: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, sport_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, sport: sport} do
      conn = put conn, sport_path(conn, :update, sport), sport: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sport" do
    setup [:create_sport]

    test "deletes chosen sport", %{conn: conn, sport: sport} do
      conn = delete conn, sport_path(conn, :delete, sport)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, sport_path(conn, :show, sport)
      end
    end
  end

  defp create_sport(_) do
    sport = fixture(:sport)
    {:ok, sport: sport}
  end
end

defmodule RocPassWeb.OpponentControllerTest do
  use RocPassWeb.ConnCase

  alias RocPass.Schedule
  alias RocPass.Schedule.Opponent

  @create_attrs %{logo_key: "some logo_key", mascot: "some mascot", name: "some name"}
  @update_attrs %{logo_key: "some updated logo_key", mascot: "some updated mascot", name: "some updated name"}
  @invalid_attrs %{logo_key: nil, mascot: nil, name: nil}

  def fixture(:opponent) do
    {:ok, opponent} = Schedule.create_opponent(@create_attrs)
    opponent
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all opponents", %{conn: conn} do
      conn = get conn, opponent_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create opponent" do
    test "renders opponent when data is valid", %{conn: conn} do
      conn = post conn, opponent_path(conn, :create), opponent: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, opponent_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "logo_key" => "some logo_key",
        "mascot" => "some mascot",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, opponent_path(conn, :create), opponent: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update opponent" do
    setup [:create_opponent]

    test "renders opponent when data is valid", %{conn: conn, opponent: %Opponent{id: id} = opponent} do
      conn = put conn, opponent_path(conn, :update, opponent), opponent: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, opponent_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "logo_key" => "some updated logo_key",
        "mascot" => "some updated mascot",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, opponent: opponent} do
      conn = put conn, opponent_path(conn, :update, opponent), opponent: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete opponent" do
    setup [:create_opponent]

    test "deletes chosen opponent", %{conn: conn, opponent: opponent} do
      conn = delete conn, opponent_path(conn, :delete, opponent)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, opponent_path(conn, :show, opponent)
      end
    end
  end

  defp create_opponent(_) do
    opponent = fixture(:opponent)
    {:ok, opponent: opponent}
  end
end

defmodule RocPassWeb.VenueControllerTest do
  use RocPassWeb.ConnCase

  alias RocPass.Schedule
  alias RocPass.Schedule.Venue

  @create_attrs %{address: "some address", city: "some city", latitude: "some lat", longitude: "some long", name: "some name", photo_key: "some photo_key", state: "st", zip_code: "some zip"}
  @update_attrs %{address: "some updated address", city: "some updated city", latitude: "updtd lat", longitude: "updtd long", name: "some updated name", photo_key: "some updated photo_key", state: "us", zip_code: "updatedzip"}
  @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, name: nil, photo_key: nil, state: nil, zip_code: nil}

  def fixture(:venue) do
    {:ok, venue} = Schedule.create_venue(@create_attrs)
    venue
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all venues", %{conn: conn} do
      conn = get conn, venue_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create venue" do
    test "renders venue when data is valid", %{conn: conn} do
      conn = post conn, venue_path(conn, :create), venue: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, venue_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some address",
        "city" => "some city",
        "latitude" => "some lat",
        "longitude" => "some long",
        "name" => "some name",
        "photo_key" => "some photo_key",
        "state" => "st",
        "zip_code" => "some zip"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, venue_path(conn, :create), venue: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update venue" do
    setup [:create_venue]

    test "renders venue when data is valid", %{conn: conn, venue: %Venue{id: id} = venue} do
      conn = put conn, venue_path(conn, :update, venue), venue: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, venue_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some updated address",
        "city" => "some updated city",
        "latitude" => "updtd lat",
        "longitude" => "updtd long",
        "name" => "some updated name",
        "photo_key" => "some updated photo_key",
        "state" => "us",
        "zip_code" => "updatedzip"}
    end

    test "renders errors when data is invalid", %{conn: conn, venue: venue} do
      conn = put conn, venue_path(conn, :update, venue), venue: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete venue" do
    setup [:create_venue]

    test "deletes chosen venue", %{conn: conn, venue: venue} do
      conn = delete conn, venue_path(conn, :delete, venue)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, venue_path(conn, :show, venue)
      end
    end
  end

  defp create_venue(_) do
    venue = fixture(:venue)
    {:ok, venue: venue}
  end
end

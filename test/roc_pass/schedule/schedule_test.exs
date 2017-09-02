defmodule RocPass.ScheduleTest do
  use RocPass.DataCase

  alias RocPass.Schedule

  describe "sports" do
    alias RocPass.Schedule.Sport

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def sport_fixture(attrs \\ %{}) do
      {:ok, sport} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_sport()

      sport
    end

    test "list_sports/0 returns all sports" do
      sport = sport_fixture()
      assert Schedule.list_sports() == [sport]
    end

    test "get_sport!/1 returns the sport with given id" do
      sport = sport_fixture()
      assert Schedule.get_sport!(sport.id) == sport
    end

    test "create_sport/1 with valid data creates a sport" do
      assert {:ok, %Sport{} = sport} = Schedule.create_sport(@valid_attrs)
      assert sport.name == "some name"
    end

    test "create_sport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_sport(@invalid_attrs)
    end

    test "update_sport/2 with valid data updates the sport" do
      sport = sport_fixture()
      assert {:ok, sport} = Schedule.update_sport(sport, @update_attrs)
      assert %Sport{} = sport
      assert sport.name == "some updated name"
    end

    test "update_sport/2 with invalid data returns error changeset" do
      sport = sport_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_sport(sport, @invalid_attrs)
      assert sport == Schedule.get_sport!(sport.id)
    end

    test "delete_sport/1 deletes the sport" do
      sport = sport_fixture()
      assert {:ok, %Sport{}} = Schedule.delete_sport(sport)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_sport!(sport.id) end
    end

    test "change_sport/1 returns a sport changeset" do
      sport = sport_fixture()
      assert %Ecto.Changeset{} = Schedule.change_sport(sport)
    end
  end

  describe "venues" do
    alias RocPass.Schedule.Venue

    @valid_attrs %{address: "some address", city: "some city", latitude: "some lat", longitude: "some long", name: "some name", photo_key: "some photo_key", state: "st", zip_code: "some zip"}
    @update_attrs %{address: "some updated address", city: "some updated city", latitude: "updtd lat", longitude: "updtd long", name: "some updated name", photo_key: "some updated photo_key", state: "us", zip_code: "updatedzip"}
    @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, name: nil, photo_key: nil, state: nil, zip_code: nil}

    def venue_fixture(attrs \\ %{}) do
      {:ok, venue} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_venue()

      venue
    end

    test "list_venues/0 returns all venues" do
      venue = venue_fixture()
      assert Schedule.list_venues() == [venue]
    end

    test "get_venue!/1 returns the venue with given id" do
      venue = venue_fixture()
      assert Schedule.get_venue!(venue.id) == venue
    end

    test "create_venue/1 with valid data creates a venue" do
      assert {:ok, %Venue{} = venue} = Schedule.create_venue(@valid_attrs)
      assert venue.address == "some address"
      assert venue.city == "some city"
      assert venue.latitude == "some lat"
      assert venue.longitude == "some long"
      assert venue.name == "some name"
      assert venue.photo_key == "some photo_key"
      assert venue.state == "st"
      assert venue.zip_code == "some zip"
    end

    test "create_venue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_venue(@invalid_attrs)
    end

    test "update_venue/2 with valid data updates the venue" do
      venue = venue_fixture()
      assert {:ok, venue} = Schedule.update_venue(venue, @update_attrs)
      assert %Venue{} = venue
      assert venue.address == "some updated address"
      assert venue.city == "some updated city"
      assert venue.latitude == "updtd lat"
      assert venue.longitude == "updtd long"
      assert venue.name == "some updated name"
      assert venue.photo_key == "some updated photo_key"
      assert venue.state == "us"
      assert venue.zip_code == "updatedzip"
    end

    test "update_venue/2 with invalid data returns error changeset" do
      venue = venue_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_venue(venue, @invalid_attrs)
      assert venue == Schedule.get_venue!(venue.id)
    end

    test "delete_venue/1 deletes the venue" do
      venue = venue_fixture()
      assert {:ok, %Venue{}} = Schedule.delete_venue(venue)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_venue!(venue.id) end
    end

    test "change_venue/1 returns a venue changeset" do
      venue = venue_fixture()
      assert %Ecto.Changeset{} = Schedule.change_venue(venue)
    end
  end

  describe "opponents" do
    alias RocPass.Schedule.Opponent

    @valid_attrs %{logo_key: "some logo_key", mascot: "some mascot", name: "some name"}
    @update_attrs %{logo_key: "some updated logo_key", mascot: "some updated mascot", name: "some updated name"}
    @invalid_attrs %{logo_key: nil, mascot: nil, name: nil}

    def opponent_fixture(attrs \\ %{}) do
      {:ok, opponent} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_opponent()

      opponent
    end

    test "list_opponents/0 returns all opponents" do
      opponent = opponent_fixture()
      assert Schedule.list_opponents() == [opponent]
    end

    test "get_opponent!/1 returns the opponent with given id" do
      opponent = opponent_fixture()
      assert Schedule.get_opponent!(opponent.id) == opponent
    end

    test "create_opponent/1 with valid data creates an opponent" do
      assert {:ok, %Opponent{} = opponent} = Schedule.create_opponent(@valid_attrs)
      assert opponent.logo_key == "some logo_key"
      assert opponent.mascot == "some mascot"
      assert opponent.name == "some name"
    end

    test "create_opponent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_opponent(@invalid_attrs)
    end

    test "update_opponent/2 with valid data updates the opponent" do
      opponent = opponent_fixture()
      assert {:ok, opponent} = Schedule.update_opponent(opponent, @update_attrs)
      assert %Opponent{} = opponent
      assert opponent.logo_key == "some updated logo_key"
      assert opponent.mascot == "some updated mascot"
      assert opponent.name == "some updated name"
    end

    test "update_opponent/2 with invalid data returns error changeset" do
      opponent = opponent_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_opponent(opponent, @invalid_attrs)
      assert opponent == Schedule.get_opponent!(opponent.id)
    end

    test "delete_opponent/1 deletes the opponent" do
      opponent = opponent_fixture()
      assert {:ok, %Opponent{}} = Schedule.delete_opponent(opponent)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_opponent!(opponent.id) end
    end

    test "change_opponent/1 returns an opponent changeset" do
      opponent = opponent_fixture()
      assert %Ecto.Changeset{} = Schedule.change_opponent(opponent)
    end
  end

  describe "events" do
    alias RocPass.Schedule.Event

    @valid_attrs %{start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{start: nil}

    @opponent_attrs %{logo_key: "some logo_key", mascot: "some mascot", name: "some name"}
    @sport_attrs %{name: "some name"}
    @venue_attrs %{address: "some address", city: "some city", latitude: "some lat", longitude: "some long", name: "some name", photo_key: "some photo_key", state: "st", zip_code: "some zip"}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_event()

      event
    end

    def relations do
      %{
        sport_id: sport_fixture(@sport_attrs).id,
        opponent_id: opponent_fixture(@opponent_attrs).id,
        venue_id: venue_fixture(@venue_attrs).id
      }
    end

    test "list_events/0 returns all events" do
      event =
        relations()
        |> event_fixture
      assert Schedule.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event =
        relations()
        |> event_fixture()
      assert Schedule.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates an event" do
      assert {:ok, %Event{} = event} =
        relations()
        |> Enum.into(@valid_attrs)
        |> Schedule.create_event
      assert event.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
        relations()
        |> Enum.into(@invalid_attrs)
        |> Schedule.create_event
    end

    test "update_event/2 with valid data updates the event" do
      event =
        relations()
        |> event_fixture
      updated =
        relations()
        |> Enum.into(@update_attrs)

      assert {:ok, event} = Schedule.update_event(event, updated)
      assert %Event{} = event

      assert event.start == ~N[2011-05-18 15:01:01.000000]
      assert event.opponent_id == updated.opponent_id
      assert event.sport_id == updated.sport_id
      assert event.venue_id == updated.venue_id
    end

    test "update_event/2 with invalid data returns error changeset" do
      event =
        relations()
        |> event_fixture
      assert {:error, %Ecto.Changeset{}} = Schedule.update_event(event, @invalid_attrs)
      assert event == Schedule.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event =
        relations()
        |> event_fixture()
      assert {:ok, %Event{}} = Schedule.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_event!(event.id) end
    end

    test "change_event/1 returns an event changeset" do
      event =
        relations()
        |> event_fixture
      assert %Ecto.Changeset{} = Schedule.change_event(event)
    end
  end
end

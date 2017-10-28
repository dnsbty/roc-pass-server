defmodule RocPassWeb.EventView do
  use RocPassWeb, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      id: event.id,
      sport: render_one(event.sport, SportView, "sport.json"),
      is_home_game: event.is_home_game,
      opponent: render_one(event.opponent, OpponentView, "opponent.json"),
      venue: render_one(event.venue, VenueView, "venue.json"),
      start: event.start,
      date_only: event.date_only,
      tv_station: event.tv_station
    }
  end

  def render("last_updated.json", %{last_updated: last_updated}) do
    %{
      data: %{
        last_updated: last_updated
      }
    }
  end
end

defmodule RocPassWeb.EventView do
  use RocPassWeb, :view
  alias RocPassWeb.{
    EventView,
    OpponentView,
    SportView,
    VenueView
  }

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      sport: render_one(event.sport, SportView, "sport.json"),
      opponent: render_one(event.opponent, OpponentView, "opponent.json"),
      venue: render_one(event.venue, VenueView, "venue.json"),
      start: event.start}
  end
end

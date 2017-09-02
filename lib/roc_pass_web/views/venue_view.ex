defmodule RocPassWeb.VenueView do
  use RocPassWeb, :view
  alias RocPassWeb.VenueView

  def render("index.json", %{venues: venues}) do
    %{data: render_many(venues, VenueView, "venue.json")}
  end

  def render("show.json", %{venue: venue}) do
    %{data: render_one(venue, VenueView, "venue.json")}
  end

  def render("venue.json", %{venue: venue}) do
    %{id: venue.id,
      address: venue.address,
      city: venue.city,
      latitude: venue.latitude,
      longitude: venue.longitude,
      name: venue.name,
      photo_key: venue.photo_key,
      state: venue.state,
      zip_code: venue.zip_code}
  end
end

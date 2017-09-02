defmodule RocPassWeb.SportView do
  use RocPassWeb, :view
  alias RocPassWeb.SportView

  def render("index.json", %{sports: sports}) do
    %{data: render_many(sports, SportView, "sport.json")}
  end

  def render("show.json", %{sport: sport}) do
    %{data: render_one(sport, SportView, "sport.json")}
  end

  def render("sport.json", %{sport: sport}) do
    %{id: sport.id,
      name: sport.name}
  end
end

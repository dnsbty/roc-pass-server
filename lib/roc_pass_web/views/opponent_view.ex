defmodule RocPassWeb.OpponentView do
  use RocPassWeb, :view
  alias RocPassWeb.OpponentView

  def render("index.json", %{opponents: opponents}) do
    %{data: render_many(opponents, OpponentView, "opponent.json")}
  end

  def render("show.json", %{opponent: opponent}) do
    %{data: render_one(opponent, OpponentView, "opponent.json")}
  end

  def render("opponent.json", %{opponent: opponent}) do
    %{id: opponent.id,
      name: opponent.name,
      mascot: opponent.mascot,
      logo_key: opponent.logo_key}
  end
end

defmodule RocPass.Schedule.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias RocPass.Schedule.{
    Event,
    Opponent,
    Sport,
    Venue
  }


  schema "events" do
    field :start, :naive_datetime

    belongs_to :sport, Sport
    belongs_to :opponent, Opponent
    belongs_to :venue, Venue

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:start, :sport_id, :opponent_id, :venue_id])
    |> validate_required([:start, :sport_id, :opponent_id, :venue_id])
    |> foreign_key_constraint(:sport_id)
    |> foreign_key_constraint(:opponent_id)
    |> foreign_key_constraint(:venue_id)
  end
end

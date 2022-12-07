defmodule JacahBackendWeb.CardsView do
  use JacahBackendWeb, :view
  alias JacahBackendWeb.CardsView

  def render("index.json", %{cards: cards}) do
    %{data: render_many(cards, CardsView, "cards.json")}
  end

  def render("show.json", %{cards: cards}) do
    %{data: render_one(cards, CardsView, "cards.json")}
  end

  def render("cards.json", %{cards: cards}) do
    %{
      id: cards.id,
      id: cards.id,
      content: cards.content,
      pack_id: cards.pack_id
    }
  end
end

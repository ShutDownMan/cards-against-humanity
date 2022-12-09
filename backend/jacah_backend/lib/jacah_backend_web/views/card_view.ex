defmodule JacahBackendWeb.CardView do
  use JacahBackendWeb, :view
  alias JacahBackendWeb.CardView

  def render("index.json", %{card: card}) do
    %{data: render_many(card, CardView, "card.json")}
  end

  def render("show.json", %{card: card}) do
    %{data: render_one(card, CardView, "card.json")}
  end

  def render("card.json", %{card: card}) do
    %{
      id: card.id,
      content: card.content,
      pack_id: card.pack_id,
      card_type: card.card_type,
    }
  end
end

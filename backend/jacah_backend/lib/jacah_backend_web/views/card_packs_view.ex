defmodule JacahBackendWeb.CardPacksView do
  use JacahBackendWeb, :view
  alias JacahBackendWeb.CardPacksView

  def render("index.json", %{card-packs: card-packs}) do
    %{data: render_many(card-packs, CardPacksView, "card_packs.json")}
  end

  def render("show.json", %{card_packs: card_packs}) do
    %{data: render_one(card_packs, CardPacksView, "card_packs.json")}
  end

  def render("card_packs.json", %{card_packs: card_packs}) do
    %{
      id: card_packs.id,
      id: card_packs.id,
      name: card_packs.name,
      description: card_packs.description
    }
  end
end

defmodule JacahBackendWeb.CardPackView do
  use JacahBackendWeb, :view
  alias JacahBackendWeb.CardPackView

  def render("index.json", %{card_pack: card_pack}) do
    %{data: render_many(card_pack, CardPackView, "card_pack.json")}
  end

  def render("show.json", %{card_pack: card_pack}) do
    %{data: render_one(card_pack, CardPackView, "card_pack.json")}
  end

  def render("card_pack.json", %{card_pack: card_pack}) do
    %{
      id: card_pack.id,
      name: card_pack.name,
      description: card_pack.description
    }
  end
end

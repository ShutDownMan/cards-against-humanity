defmodule JacahBackendWeb.CardsController do
  use JacahBackendWeb, :controller

  alias JacahBackend.Game
  alias JacahBackend.Game.Cards

  action_fallback JacahBackendWeb.FallbackController

  def index(conn, _params) do
    cards = Game.list_cards()
    render(conn, "index.json", cards: cards)
  end

  def create(conn, %{"cards" => cards_params}) do
    with {:ok, %Cards{} = cards} <- Game.create_cards(cards_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cards_path(conn, :show, cards))
      |> render("show.json", cards: cards)
    end
  end

  def show(conn, %{"id" => id}) do
    cards = Game.get_cards!(id)
    render(conn, "show.json", cards: cards)
  end

  def update(conn, %{"id" => id, "cards" => cards_params}) do
    cards = Game.get_cards!(id)

    with {:ok, %Cards{} = cards} <- Game.update_cards(cards, cards_params) do
      render(conn, "show.json", cards: cards)
    end
  end

  def delete(conn, %{"id" => id}) do
    cards = Game.get_cards!(id)

    with {:ok, %Cards{}} <- Game.delete_cards(cards) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule JacahBackendWeb.CardPacksController do
  use JacahBackendWeb, :controller

  alias JacahBackend.Game
  alias JacahBackend.Game.CardPacks

  action_fallback JacahBackendWeb.FallbackController

  def index(conn, _params) do
    card-packs = Game.list_card-packs()
    render(conn, "index.json", card-packs: card-packs)
  end

  def create(conn, %{"card_packs" => card_packs_params}) do
    with {:ok, %CardPacks{} = card_packs} <- Game.create_card_packs(card_packs_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.card_packs_path(conn, :show, card_packs))
      |> render("show.json", card_packs: card_packs)
    end
  end

  def show(conn, %{"id" => id}) do
    card_packs = Game.get_card_packs!(id)
    render(conn, "show.json", card_packs: card_packs)
  end

  def update(conn, %{"id" => id, "card_packs" => card_packs_params}) do
    card_packs = Game.get_card_packs!(id)

    with {:ok, %CardPacks{} = card_packs} <- Game.update_card_packs(card_packs, card_packs_params) do
      render(conn, "show.json", card_packs: card_packs)
    end
  end

  def delete(conn, %{"id" => id}) do
    card_packs = Game.get_card_packs!(id)

    with {:ok, %CardPacks{}} <- Game.delete_card_packs(card_packs) do
      send_resp(conn, :no_content, "")
    end
  end
end

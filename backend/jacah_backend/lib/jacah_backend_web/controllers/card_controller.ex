defmodule JacahBackendWeb.CardController do
  use JacahBackendWeb, :controller

  alias JacahBackend.Game
  alias JacahBackend.Game.Card

  action_fallback JacahBackendWeb.FallbackController

  def index(conn, _params) do
    cards = Game.list_cards()
    render(conn, "index.json", card: cards)
  end

  def create(conn, %{"card" => card_params}) do
    with {:ok, %Card{} = card} <- Game.create_card(card_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.card_path(conn, :show, card))
      |> render("show.json", card: card)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JacahBackendWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    card = Game.get_card!(id)
    render(conn, "show.json", card: card)
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    card = Game.get_card!(id)

    with {:ok, %Card{} = card} <- Game.update_card(card, card_params) do
      render(conn, "show.json", card: card)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JacahBackendWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    card = Game.get_card!(id)

    with {:ok, %Card{}} <- Game.delete_card(card) do
      send_resp(conn, :no_content, "")
    else
      {:error, :not_found} -> send_resp(conn, :not_found, "")
    end
  end
end

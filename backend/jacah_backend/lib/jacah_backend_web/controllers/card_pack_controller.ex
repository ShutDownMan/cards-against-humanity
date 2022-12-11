defmodule JacahBackendWeb.CardPackController do
  use JacahBackendWeb, :controller

  alias JacahBackend.Game
  alias JacahBackend.Game.CardPack

  action_fallback JacahBackendWeb.FallbackController

  def index(conn, _params) do
    card_pack = Game.list_card_pack()
    render(conn, "index.json", card_pack: card_pack)
  end

  def create(conn, %{"card_pack" => card_pack_params}) do
    with {:ok, %CardPack{} = card_pack} <- Game.create_card_pack(card_pack_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.card_pack_path(conn, :show, card_pack))
      |> render("show.json", card_pack: card_pack)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(JacahBackendWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    card_pack = Game.get_card_pack!(id)
    render(conn, "show.json", card_pack: card_pack)
  end

  def update(conn, %{"id" => id, "card_pack" => card_pack_params}) do
    card_pack = Game.get_card_pack!(id)

    with {:ok, %CardPack{} = card_pack} <- Game.update_card_pack(card_pack, card_pack_params) do
      render(conn, "show.json", card_pack: card_pack)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(JacahBackendWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    card_pack = Game.get_card_pack!(id)

    with {:ok, %CardPack{}} <- Game.delete_card_pack(card_pack) do
      send_resp(conn, :no_content, "")
    else
      {:error, :not_found} -> send_resp(conn, :not_found, "")
    end
  end
end

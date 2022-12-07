defmodule JacahBackendWeb.CardPacksControllerTest do
  use JacahBackendWeb.ConnCase

  import JacahBackend.GameFixtures

  alias JacahBackend.Game.CardPacks

  @create_attrs %{
    description: "some description",
    id: "7488a646-e31f-11e4-aace-600308960662",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    id: "7488a646-e31f-11e4-aace-600308960668",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, id: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all card-packs", %{conn: conn} do
      conn = get(conn, Routes.card_packs_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create card_packs" do
    test "renders card_packs when data is valid", %{conn: conn} do
      conn = post(conn, Routes.card_packs_path(conn, :create), card_packs: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.card_packs_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.card_packs_path(conn, :create), card_packs: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update card_packs" do
    setup [:create_card_packs]

    test "renders card_packs when data is valid", %{conn: conn, card_packs: %CardPacks{id: id} = card_packs} do
      conn = put(conn, Routes.card_packs_path(conn, :update, card_packs), card_packs: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.card_packs_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, card_packs: card_packs} do
      conn = put(conn, Routes.card_packs_path(conn, :update, card_packs), card_packs: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete card_packs" do
    setup [:create_card_packs]

    test "deletes chosen card_packs", %{conn: conn, card_packs: card_packs} do
      conn = delete(conn, Routes.card_packs_path(conn, :delete, card_packs))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.card_packs_path(conn, :show, card_packs))
      end
    end
  end

  defp create_card_packs(_) do
    card_packs = card_packs_fixture()
    %{card_packs: card_packs}
  end
end

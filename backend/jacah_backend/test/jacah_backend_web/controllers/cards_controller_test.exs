defmodule JacahBackendWeb.CardsControllerTest do
  use JacahBackendWeb.ConnCase

  import JacahBackend.GameFixtures

  alias JacahBackend.Game.Cards

  @create_attrs %{
    content: "some content",
    id: "7488a646-e31f-11e4-aace-600308960662",
    pack_id: "7488a646-e31f-11e4-aace-600308960662"
  }
  @update_attrs %{
    content: "some updated content",
    id: "7488a646-e31f-11e4-aace-600308960668",
    pack_id: "7488a646-e31f-11e4-aace-600308960668"
  }
  @invalid_attrs %{content: nil, id: nil, pack_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cards", %{conn: conn} do
      conn = get(conn, Routes.cards_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cards" do
    test "renders cards when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cards_path(conn, :create), cards: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.cards_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some content",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "pack_id" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cards_path(conn, :create), cards: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cards" do
    setup [:create_cards]

    test "renders cards when data is valid", %{conn: conn, cards: %Cards{id: id} = cards} do
      conn = put(conn, Routes.cards_path(conn, :update, cards), cards: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.cards_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some updated content",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "pack_id" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cards: cards} do
      conn = put(conn, Routes.cards_path(conn, :update, cards), cards: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cards" do
    setup [:create_cards]

    test "deletes chosen cards", %{conn: conn, cards: cards} do
      conn = delete(conn, Routes.cards_path(conn, :delete, cards))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.cards_path(conn, :show, cards))
      end
    end
  end

  defp create_cards(_) do
    cards = cards_fixture()
    %{cards: cards}
  end
end

defmodule JacahBackendWeb.CardControllerTest do
  use JacahBackendWeb.ConnCase

  import JacahBackend.GameFixtures

  alias JacahBackend.Game.Card

  @invalid_attrs %{content: nil, id: nil, pack_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all card", %{conn: conn} do
      conn = get(conn, Routes.card_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create card" do
    test "renders card when data is valid", %{conn: conn} do
      # create card pack with id
      {:ok, card_pack} = JacahBackend.Game.create_card_pack(%{
          id: "65c0b9c0-e31f-11e4-aace-600308960662",
          description: "some description",
          name: "some name"
        })
        pack_id = card_pack.id

      conn = post(conn, Routes.card_path(conn, :create), card: %{
        content: "some content",
        pack_id: card_pack.id
      })
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.card_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some content",
               "pack_id" => ^pack_id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.card_path(conn, :create), card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update card" do
    setup [:create_card]

    test "renders card when data is valid", %{conn: conn, card: %Card{id: id} = card} do
      pack_id = card.pack_id

      conn = put(conn, Routes.card_path(conn, :update, card), card: %{
        content: "some updated content",
        pack_id: pack_id
      })
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.card_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some updated content",
               "pack_id" => ^pack_id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, card: card} do
      conn = put(conn, Routes.card_path(conn, :update, card), card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete card" do
    setup [:create_card]

    test "deletes chosen card", %{conn: conn, card: card} do
      conn = delete(conn, Routes.card_path(conn, :delete, card))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, Routes.card_path(conn, :show, card))
      end)
    end
  end

  defp create_card(_) do
    # create card pack with id
    {:ok, card_pack} = JacahBackend.Game.create_card_pack(%{
      description: "some description",
      name: "some name"
    })

    card = card_fixture(card_pack.id)

    %{card: card}
  end
end

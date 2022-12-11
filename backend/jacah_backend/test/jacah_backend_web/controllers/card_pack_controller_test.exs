defmodule JacahBackendWeb.CardPackControllerTest do
  use JacahBackendWeb.ConnCase

  import JacahBackend.GameFixtures

  alias JacahBackend.Game.CardPack

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all card_pack", %{conn: conn} do
      conn = get(conn, Routes.card_pack_path(conn, :index))

      Enum.all?(json_response(conn, 200)["data"], fn card_pack ->
        assert %{
          "description" => _description,
          "name" => _name
        } = card_pack
      end)
    end
  end

  describe "create card_pack" do
    test "renders card_pack when data is valid", %{conn: conn} do
      conn = post(conn, Routes.card_pack_path(conn, :create), card_pack: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.card_pack_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.card_pack_path(conn, :create), card_pack: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update card_pack" do
    setup [:create_card_pack]

    test "renders card_pack when data is valid", %{conn: conn, card_pack: %CardPack{id: id} = card_pack} do
      conn = put(conn, Routes.card_pack_path(conn, :update, card_pack), card_pack: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.card_pack_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, card_pack: card_pack} do
      conn = put(conn, Routes.card_pack_path(conn, :update, card_pack), card_pack: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete card_pack" do
    setup [:create_card_pack]

    test "deletes chosen card_pack", %{conn: conn, card_pack: card_pack} do
      conn = delete(conn, Routes.card_pack_path(conn, :delete, card_pack))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.card_pack_path(conn, :show, card_pack))
      end
    end
  end

  defp create_card_pack(_) do
    card_pack = card_pack_fixture()
    %{card_pack: card_pack}
  end
end

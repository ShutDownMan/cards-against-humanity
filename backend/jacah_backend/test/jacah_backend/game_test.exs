defmodule JacahBackend.GameTest do
  use JacahBackend.DataCase

  alias JacahBackend.Game

  describe "card_pack" do
    alias JacahBackend.Game.CardPack

    import JacahBackend.GameFixtures

    @invalid_attrs %{description: nil, id: nil, name: nil}

    test "list_card_pack/0 returns all card_pack" do
      Enum.all?(Game.list_card_pack(), fn card_pack ->
        assert %CardPack{} = card_pack
      end)
    end

    test "get_card_pack!/1 returns the card_pack with given id" do
      card_pack = card_pack_fixture()
      assert Game.get_card_pack!(card_pack.id) == card_pack
    end

    test "create_card_pack/1 with valid data creates a card_pack" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %CardPack{} = card_pack} = Game.create_card_pack(valid_attrs)
      assert card_pack.description == "some description"
      assert card_pack.name == "some name"
    end

    test "create_card_pack/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_card_pack(@invalid_attrs)
    end

    test "update_card_pack/2 with valid data updates the card_pack" do
      card_pack = card_pack_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %CardPack{} = card_pack} = Game.update_card_pack(card_pack, update_attrs)
      assert card_pack.description == "some updated description"
      assert card_pack.name == "some updated name"
    end

    test "update_card_pack/2 with invalid data returns error changeset" do
      card_pack = card_pack_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_card_pack(card_pack, @invalid_attrs)
      assert card_pack == Game.get_card_pack!(card_pack.id)
    end

    test "delete_card_pack/1 deletes the card_pack" do
      card_pack = card_pack_fixture()
      assert {:ok, %CardPack{}} = Game.delete_card_pack(card_pack)
      assert_raise Ecto.NoResultsError, fn -> Game.get_card_pack!(card_pack.id) end
    end

    test "change_card_pack/1 returns a card_pack changeset" do
      card_pack = card_pack_fixture()
      assert %Ecto.Changeset{} = Game.change_card_pack(card_pack)
    end
  end

  describe "card" do
    alias JacahBackend.Game.Card

    import JacahBackend.GameFixtures

    @invalid_attrs %{content: nil, id: nil}

    test "list_cards/0 returns all card" do
      Enum.all?(Game.list_cards(), fn card ->
        assert %Card{} = card
      end)
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture("65c0b9c0-e31f-11e4-aace-600308960662")
      assert Game.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{
        content: "some content",
        pack_id: "65c0b9c0-e31f-11e4-aace-600308960662",
        card_type: "answer"
      }

      assert {:ok, %Card{} = card} = Game.create_card(valid_attrs)
      assert card.content == "some content"
      assert card.pack_id == "65c0b9c0-e31f-11e4-aace-600308960662"
      assert card.card_type == "answer"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture("65c0b9c0-e31f-11e4-aace-600308960662")
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Card{} = card} = Game.update_card(card, update_attrs)
      assert card.content == "some updated content"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture("65c0b9c0-e31f-11e4-aace-600308960662")
      assert {:error, %Ecto.Changeset{}} = Game.update_card(card, @invalid_attrs)
      assert card == Game.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture("65c0b9c0-e31f-11e4-aace-600308960662")
      assert {:ok, %Card{}} = Game.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Game.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture("65c0b9c0-e31f-11e4-aace-600308960662")
      assert %Ecto.Changeset{} = Game.change_card(card)
    end
  end
end

defmodule JacahBackend.GameTest do
  use JacahBackend.DataCase

  alias JacahBackend.Game

  describe "card-packs" do
    alias JacahBackend.Game.CardPack

    import JacahBackend.GameFixtures

    @invalid_attrs %{description: nil, id: nil, name: nil}

    test "list_card-packs/0 returns all card-packs" do
      card_pack = card_pack_fixture()
      assert Game.list_card-packs() == [card_pack]
    end

    test "get_card_pack!/1 returns the card_pack with given id" do
      card_pack = card_pack_fixture()
      assert Game.get_card_pack!(card_pack.id) == card_pack
    end

    test "create_card_pack/1 with valid data creates a card_pack" do
      valid_attrs = %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}

      assert {:ok, %CardPack{} = card_pack} = Game.create_card_pack(valid_attrs)
      assert card_pack.description == "some description"
      assert card_pack.id == "7488a646-e31f-11e4-aace-600308960662"
      assert card_pack.name == "some name"
    end

    test "create_card_pack/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_card_pack(@invalid_attrs)
    end

    test "update_card_pack/2 with valid data updates the card_pack" do
      card_pack = card_pack_fixture()
      update_attrs = %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}

      assert {:ok, %CardPack{} = card_pack} = Game.update_card_pack(card_pack, update_attrs)
      assert card_pack.description == "some updated description"
      assert card_pack.id == "7488a646-e31f-11e4-aace-600308960668"
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

  describe "cards" do
    alias JacahBackend.Game.Cards

    import JacahBackend.GameFixtures

    @invalid_attrs %{content: nil, id: nil}

    test "list_cards/0 returns all cards" do
      cards = cards_fixture()
      assert Game.list_cards() == [cards]
    end

    test "get_cards!/1 returns the cards with given id" do
      cards = cards_fixture()
      assert Game.get_cards!(cards.id) == cards
    end

    test "create_cards/1 with valid data creates a cards" do
      valid_attrs = %{content: "some content", id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Cards{} = cards} = Game.create_cards(valid_attrs)
      assert cards.content == "some content"
      assert cards.id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_cards/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_cards(@invalid_attrs)
    end

    test "update_cards/2 with valid data updates the cards" do
      cards = cards_fixture()
      update_attrs = %{content: "some updated content", id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Cards{} = cards} = Game.update_cards(cards, update_attrs)
      assert cards.content == "some updated content"
      assert cards.id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_cards/2 with invalid data returns error changeset" do
      cards = cards_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_cards(cards, @invalid_attrs)
      assert cards == Game.get_cards!(cards.id)
    end

    test "delete_cards/1 deletes the cards" do
      cards = cards_fixture()
      assert {:ok, %Cards{}} = Game.delete_cards(cards)
      assert_raise Ecto.NoResultsError, fn -> Game.get_cards!(cards.id) end
    end

    test "change_cards/1 returns a cards changeset" do
      cards = cards_fixture()
      assert %Ecto.Changeset{} = Game.change_cards(cards)
    end
  end
end

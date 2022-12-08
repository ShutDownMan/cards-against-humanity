defmodule JacahBackend.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JacahBackend.Game` context.
  """

  @doc """
  Generate a card_pack.
  """
  def card_pack_fixture(attrs \\ %{}) do
    {:ok, card_pack} =
      attrs
      |> Enum.into(%{
        id: attrs[:id] || "65c0b9c0-e31f-11e4-aace-600308960662",
        description: "some description",
        name: "some name"
      })
      |> JacahBackend.Game.create_card_pack()

    card_pack
  end

  @doc """
  Generate a card and associate it with the given card_pack.
  passing the card pack id
  """
  def card_fixture(pack_id, attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        content: "some content",
        pack_id: pack_id
      })
      |> JacahBackend.Game.create_card()

    card
  end
end

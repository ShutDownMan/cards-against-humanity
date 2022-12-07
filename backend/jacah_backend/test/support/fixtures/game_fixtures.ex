defmodule JacahBackend.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JacahBackend.Game` context.
  """

  @doc """
  Generate a unique card_pack id.
  """
  def unique_card_pack_id do
    raise "implement the logic to generate a unique card_pack id"
  end

  @doc """
  Generate a card_pack.
  """
  def card_pack_fixture(attrs \\ %{}) do
    {:ok, card_pack} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: unique_card_pack_id(),
        name: "some name"
      })
      |> JacahBackend.Game.create_card_pack()

    card_pack
  end

  @doc """
  Generate a unique cards id.
  """
  def unique_cards_id do
    raise "implement the logic to generate a unique cards id"
  end

  @doc """
  Generate a cards.
  """
  def cards_fixture(attrs \\ %{}) do
    {:ok, cards} =
      attrs
      |> Enum.into(%{
        content: "some content",
        id: unique_cards_id()
      })
      |> JacahBackend.Game.create_cards()

    cards
  end
end

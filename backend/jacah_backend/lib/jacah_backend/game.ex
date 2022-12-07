defmodule JacahBackend.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias JacahBackend.Repo

  alias JacahBackend.Game.CardPack

  @doc """
  Returns the list of card-packs.

  ## Examples

      iex> list_card-packs()
      [%CardPack{}, ...]

  """
  def list_card-packs do
    Repo.all(CardPack)
  end

  @doc """
  Gets all cards of a card pack.

  ## Examples

      iex> get_cards_of_card_pack(card_pack)
      [%Card{}, ...]
  """
  def get_cards_of_card_pack(card_pack) do
    Repo.all(from c in JacahBackend.Game.Cards, where: c.pack_id == ^card_pack.id)
  end

  @doc """
  Gets a single card_pack.

  Raises `Ecto.NoResultsError` if the Card pack does not exist.

  ## Examples

      iex> get_card_pack!(123)
      %CardPack{}

      iex> get_card_pack!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card_pack!(id), do: Repo.get!(CardPack, id)

  @doc """
  Creates a card_pack.

  ## Examples

      iex> create_card_pack(%{field: value})
      {:ok, %CardPack{}}

      iex> create_card_pack(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card_pack(attrs \\ %{}) do
    %CardPack{}
    |> CardPack.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card_pack.

  ## Examples

      iex> update_card_pack(card_pack, %{field: new_value})
      {:ok, %CardPack{}}

      iex> update_card_pack(card_pack, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card_pack(%CardPack{} = card_pack, attrs) do
    card_pack
    |> CardPack.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a card_pack.

  ## Examples

      iex> delete_card_pack(card_pack)
      {:ok, %CardPack{}}

      iex> delete_card_pack(card_pack)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card_pack(%CardPack{} = card_pack) do
    Repo.delete(card_pack)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card_pack changes.

  ## Examples

      iex> change_card_pack(card_pack)
      %Ecto.Changeset{data: %CardPack{}}

  """
  def change_card_pack(%CardPack{} = card_pack, attrs \\ %{}) do
    CardPack.changeset(card_pack, attrs)
  end

  alias JacahBackend.Game.Cards

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Cards{}, ...]

  """
  def list_cards do
    Repo.all(Cards)
  end

  @doc """
  Gets a single cards.

  Raises `Ecto.NoResultsError` if the Cards does not exist.

  ## Examples

      iex> get_cards!(123)
      %Cards{}

      iex> get_cards!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cards!(id), do: Repo.get!(Cards, id)

  @doc """
  Creates a cards.

  ## Examples

      iex> create_cards(%{field: value})
      {:ok, %Cards{}}

      iex> create_cards(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cards(attrs \\ %{}) do
    %Cards{}
    |> Cards.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cards.

  ## Examples

      iex> update_cards(cards, %{field: new_value})
      {:ok, %Cards{}}

      iex> update_cards(cards, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cards(%Cards{} = cards, attrs) do
    cards
    |> Cards.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cards.

  ## Examples

      iex> delete_cards(cards)
      {:ok, %Cards{}}

      iex> delete_cards(cards)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cards(%Cards{} = cards) do
    Repo.delete(cards)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cards changes.

  ## Examples

      iex> change_cards(cards)
      %Ecto.Changeset{data: %Cards{}}

  """
  def change_cards(%Cards{} = cards, attrs \\ %{}) do
    Cards.changeset(cards, attrs)
  end
end

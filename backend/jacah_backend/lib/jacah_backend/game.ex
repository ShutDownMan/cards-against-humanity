defmodule JacahBackend.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias JacahBackend.Repo

  alias JacahBackend.Game.CardPack

  @doc """
  Returns the list of card_pack.

  ## Examples

      iex> list_card_pack()
      [%CardPack{}, ...]

  """
  def list_card_pack do
    Repo.all(CardPack)
  end

  @doc """
  Gets all cards of a card pack.

  ## Examples

      iex> get_cards_of_card_pack(card_pack)
      [%Card{}, ...]
  """
  def get_cards_of_card_pack(card_pack) do
    Repo.all(from c in JacahBackend.Game.Card, where: c.pack_id == ^card_pack.id)
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

  alias JacahBackend.Game.Card

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Card{}, ...]

  """
  def list_cards do
    Repo.all(Card)
  end

  @doc """
  Gets a single card.

  Raises `Ecto.NoResultsError` if the Cards does not exist.

  ## Examples

      iex> get_card!(123)
      %Card{}

      iex> get_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card!(id), do: Repo.get!(Card, id)

  @doc """
  Creates a card.

  ## Examples

      iex> create_card(%{field: value})
      {:ok, %Card{}}

      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

      iex> update_card(card, %{field: new_value})
      {:ok, %Card{}}

      iex> update_card(card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a card.

  ## Examples

      iex> delete_card(card)
      {:ok, %Card{}}

      iex> delete_card(card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card(%Card{} = card) do
    Repo.delete(card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card changes.

  ## Examples

      iex> change_card(card)
      %Ecto.Changeset{data: %Card{}}

  """
  def change_card(%Card{} = card, attrs \\ %{}) do
    Card.changeset(card, attrs)
  end
end

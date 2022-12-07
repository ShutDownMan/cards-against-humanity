defmodule JacahBackend.Game.CardPack do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "card-packs" do
    field :description, :string
    field :id, Ecto.UUID
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(card_pack, attrs) do
    card_pack
    |> cast(attrs, [:id, :name, :description])
    |> validate_required([:id, :name, :description])
    |> unique_constraint(:id)
  end
end

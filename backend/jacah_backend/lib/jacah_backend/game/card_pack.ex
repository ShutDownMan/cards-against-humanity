defmodule JacahBackend.Game.CardPack do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "card_pack" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(card_pack, attrs) do
    card_pack
    |> cast(attrs, [:description, :name])
    |> validate_required([:description, :name])
    |> unique_constraint(:id)
  end
end

defmodule JacahBackend.Game.Cards do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cards" do
    field :content, :string
    field :id, Ecto.UUID
    field :pack_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(cards, attrs) do
    cards
    |> cast(attrs, [:id, :content])
    |> validate_required([:id, :content])
    |> unique_constraint(:id)
  end
end

defmodule JacahBackend.Game.Card do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cards" do
    field :content, :string
    field :pack_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:content, :pack_id])
    |> validate_required([:content, :pack_id])
  end
end

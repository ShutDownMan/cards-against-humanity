defmodule JacahBackend.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :string
      add :card_type, :string
      add :pack_id, references(:card_pack, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:cards, [:pack_id])
  end
end

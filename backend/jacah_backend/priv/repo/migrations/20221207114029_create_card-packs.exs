defmodule JacahBackend.Repo.Migrations.CreateCard_packs do
  use Ecto.Migration

  def change do
    create table(:card_pack, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end

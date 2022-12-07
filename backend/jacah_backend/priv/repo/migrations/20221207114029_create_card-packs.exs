defmodule JacahBackend.Repo.Migrations.CreateCard-packs do
  use Ecto.Migration

  def change do
    create table(:card-packs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :id, :uuid
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:card-packs, [:id])
  end
end

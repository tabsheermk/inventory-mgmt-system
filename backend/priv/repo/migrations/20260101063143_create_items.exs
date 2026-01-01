defmodule Backend.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :sku, :string
      add :unit, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:items, [:sku])
  end
end

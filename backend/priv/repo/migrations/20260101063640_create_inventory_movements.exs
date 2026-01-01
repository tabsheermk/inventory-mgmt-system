defmodule Backend.Repo.Migrations.CreateInventoryMovements do
  use Ecto.Migration

  def change do
    create table(:inventory_movements, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :quantity, :integer
      add :movement_type, :string
      add :item_id, references(:items, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:inventory_movements, [:item_id])
  end
end

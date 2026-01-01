defmodule Backend.Repo.Migrations.ChangeInventoryMovementsEnum do
  use Ecto.Migration

  def change do
    alter table(:inventory_movements) do
      modify :movement_type, :string
    end
  end
end

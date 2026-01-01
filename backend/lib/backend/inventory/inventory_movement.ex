defmodule Backend.Inventory.InventoryMovement do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "inventory_movements" do
    field :quantity, :integer
    field :movement_type, :string
    field :" item_id", :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(inventory_movement, attrs) do
    inventory_movement
    |> cast(attrs, [:quantity, :movement_type])
    |> validate_required([:quantity, :movement_type])
  end
end

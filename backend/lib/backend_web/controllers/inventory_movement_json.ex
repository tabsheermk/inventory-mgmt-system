defmodule BackendWeb.InventoryMovementJSON do
  alias Backend.Inventory.InventoryMovement

  def index(%{movements: movements}) do
    %{
      data: Enum.map(movements, &movement_json/1)
    }
  end

  def show(%{inventory_movement: movement}) do
    %{
      data: movement_json(movement)
    }
  end

  def error(%{changeset: changeset}) do
    %{
      errors:
        Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} ->
          msg
        end)
    }
  end

  defp movement_json(%InventoryMovement{} = movement) do
    %{
      id: movement.id,
      item_id: movement.item_id,
      quantity: movement.quantity,
      movement_type: movement.movement_type,
      inserted_at: movement.inserted_at
    }
  end
end

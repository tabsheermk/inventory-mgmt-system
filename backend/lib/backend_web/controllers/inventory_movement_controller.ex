defmodule BackendWeb.InventoryMovementController do
  use BackendWeb, :controller

  alias Backend.Inventory
  alias Backend.Inventory.InventoryMovement

  # POST /api/inventory_movements
  def create(conn, params) do
  case Inventory.create_inventory_movement_new(params) do
    {:ok, movement} ->
      conn
      |> put_status(:created)
      |> render(:show, inventory_movement: movement)

    {:error, :negative_stock} ->
      conn
      |> put_status(:unprocessable_entity)
      |> json(%{errors: %{stock: ["cannot go negative"]}})

    {:error, :invalid_movement_type} ->
      conn
      |> put_status(:unprocessable_entity)
      |> json(%{errors: %{movement_type: ["invalid"]}})

    {:error, %Ecto.Changeset{} = changeset} ->
      conn
      |> put_status(:unprocessable_entity)
      |> render(:error, changeset: changeset)
  end
end

# GET /api/items/:id/movements
def index(conn, %{"id" => id}) do
  movements = Inventory.list_movements_for_item(id)
  render(conn, :index, movements: movements)
end

end

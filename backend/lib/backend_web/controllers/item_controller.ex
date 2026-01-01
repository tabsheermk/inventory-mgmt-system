defmodule BackendWeb.ItemController do
  use BackendWeb, :controller

  alias Backend.Inventory
  alias Backend.Inventory.Item

  # POST /api/items
  def create(conn, params) do
    case Inventory.create_item(params)
    do
      {:ok, %Item{} = item} ->
        conn
        |> put_status(:created)
        |> render(:show, item: item)

      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> render(:error, changeset: changeset)
    end
  end

  # GET /api/items
  def get_items(conn, _params) do
  items =
    Inventory.list_items()
    |> Enum.map(fn item ->
      stock = Inventory.get_stock(item.id)

      %{
        id: item.id,
        name: item.name,
        sku: item.sku,
        unit: item.unit,
        stock: stock
      }
    end)

    render(conn, :index, items: items)
  end
end

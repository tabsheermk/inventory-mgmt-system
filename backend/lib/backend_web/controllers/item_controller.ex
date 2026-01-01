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
      |> put_status(:unprocessable_entity)
      |> render(:error, changeset: changeset)
    end


  end
  defp translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)
  end
end

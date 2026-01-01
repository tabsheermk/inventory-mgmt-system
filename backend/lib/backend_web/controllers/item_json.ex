defmodule BackendWeb.ItemJSON do
  def show(%{item: item}) do
    %{
      id: item.id,
      name: item.name,
      sku: item.sku,
      unit: item.unit,
      inserted_at: item.inserted_at
    }
  end

  def index(%{items: items}) do
    items
  end

  def error(%{changeset: changeset}) do
    %{
      errors:
        Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} ->
          msg
        end)
    }
  end
end

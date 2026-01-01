defmodule Backend.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Inventory` context.
  """

  @doc """
  Generate a unique item sku.
  """
  def unique_item_sku, do: "some sku#{System.unique_integer([:positive])}"

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
         name: "some  name",
        sku: unique_item_sku(),
        unit: "some unit"
      })
      |> Backend.Inventory.create_item()

    item
  end

  @doc """
  Generate a inventory_movement.
  """
  def inventory_movement_fixture(attrs \\ %{}) do
    {:ok, inventory_movement} =
      attrs
      |> Enum.into(%{
        movement_type: "some movement_type",
        quantity: 42
      })
      |> Backend.Inventory.create_inventory_movement()

    inventory_movement
  end
end

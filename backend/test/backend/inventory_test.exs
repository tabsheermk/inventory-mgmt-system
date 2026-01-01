defmodule Backend.InventoryTest do
  use Backend.DataCase, async: true

  alias Backend.Inventory

  describe "stock calculation" do
    test "stock is sum(in) - sum(out) + adjustments" do
      {:ok, item} =
        Inventory.create_item(%{
          name: "Test Item",
          sku: "SKU-1",
          unit: "pcs"
        })

      Inventory.create_inventory_movement_new(%{
        item_id: item.id,
        quantity: 10,
        movement_type: "in"
      })

      Inventory.create_inventory_movement_new(%{
        item_id: item.id,
        quantity: -3,
        movement_type: "out"
      })

      Inventory.create_inventory_movement_new(%{
        item_id: item.id,
        quantity: 2,
        movement_type: "adjustment"
      })

      stock = Inventory.get_stock(item.id)

      assert stock == 9
    end
  end

  describe "negative stock protection" do
    test "rejects movement that would cause negative stock" do
      {:ok, item} =
        Inventory.create_item(%{
          name: "Another Item",
          sku: "SKU-2",
          unit: "pcs"
        })

      Inventory.create_inventory_movement_new(%{
        item_id: item.id,
        quantity: 5,
        movement_type: "in"
      })

      assert {:error, _reason} =
        Inventory.create_inventory_movement_new(%{
          item_id: item.id,
          quantity: 10,
          movement_type: "out"
        })
    end
  end
end

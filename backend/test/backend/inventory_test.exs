defmodule Backend.InventoryTest do
  use Backend.DataCase

  alias Backend.Inventory

  describe "items" do
    alias Backend.Inventory.Item

    import Backend.InventoryFixtures

    @invalid_attrs %{unit: nil, " name": nil, sku: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{unit: "some unit", " name": "some  name", sku: "some sku"}

      assert {:ok, %Item{} = item} = Inventory.create_item(valid_attrs)
      assert item.unit == "some unit"
      assert item. name == "some  name"
      assert item.sku == "some sku"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{unit: "some updated unit", " name": "some updated  name", sku: "some updated sku"}

      assert {:ok, %Item{} = item} = Inventory.update_item(item, update_attrs)
      assert item.unit == "some updated unit"
      assert item. name == "some updated  name"
      assert item.sku == "some updated sku"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end

  describe "inventory_movements" do
    alias Backend.Inventory.InventoryMovement

    import Backend.InventoryFixtures

    @invalid_attrs %{quantity: nil, movement_type: nil}

    test "list_inventory_movements/0 returns all inventory_movements" do
      inventory_movement = inventory_movement_fixture()
      assert Inventory.list_inventory_movements() == [inventory_movement]
    end

    test "get_inventory_movement!/1 returns the inventory_movement with given id" do
      inventory_movement = inventory_movement_fixture()
      assert Inventory.get_inventory_movement!(inventory_movement.id) == inventory_movement
    end

    test "create_inventory_movement/1 with valid data creates a inventory_movement" do
      valid_attrs = %{quantity: 42, movement_type: "some movement_type"}

      assert {:ok, %InventoryMovement{} = inventory_movement} = Inventory.create_inventory_movement(valid_attrs)
      assert inventory_movement.quantity == 42
      assert inventory_movement.movement_type == "some movement_type"
    end

    test "create_inventory_movement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory_movement(@invalid_attrs)
    end

    test "update_inventory_movement/2 with valid data updates the inventory_movement" do
      inventory_movement = inventory_movement_fixture()
      update_attrs = %{quantity: 43, movement_type: "some updated movement_type"}

      assert {:ok, %InventoryMovement{} = inventory_movement} = Inventory.update_inventory_movement(inventory_movement, update_attrs)
      assert inventory_movement.quantity == 43
      assert inventory_movement.movement_type == "some updated movement_type"
    end

    test "update_inventory_movement/2 with invalid data returns error changeset" do
      inventory_movement = inventory_movement_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_inventory_movement(inventory_movement, @invalid_attrs)
      assert inventory_movement == Inventory.get_inventory_movement!(inventory_movement.id)
    end

    test "delete_inventory_movement/1 deletes the inventory_movement" do
      inventory_movement = inventory_movement_fixture()
      assert {:ok, %InventoryMovement{}} = Inventory.delete_inventory_movement(inventory_movement)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory_movement!(inventory_movement.id) end
    end

    test "change_inventory_movement/1 returns a inventory_movement changeset" do
      inventory_movement = inventory_movement_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory_movement(inventory_movement)
    end
  end
end

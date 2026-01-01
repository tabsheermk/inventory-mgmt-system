defmodule Backend.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Inventory.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias Backend.Inventory.InventoryMovement

  @doc """
  Returns the list of inventory_movements.

  ## Examples

      iex> list_inventory_movements()
      [%InventoryMovement{}, ...]

  """
  def list_inventory_movements do
    Repo.all(InventoryMovement)
  end

  @doc """
  Gets a single inventory_movement.

  Raises `Ecto.NoResultsError` if the Inventory movement does not exist.

  ## Examples

      iex> get_inventory_movement!(123)
      %InventoryMovement{}

      iex> get_inventory_movement!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory_movement!(id), do: Repo.get!(InventoryMovement, id)

  @doc """
  Creates a inventory_movement.

  ## Examples

      iex> create_inventory_movement(%{field: value})
      {:ok, %InventoryMovement{}}

      iex> create_inventory_movement(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory_movement(attrs) do
    %InventoryMovement{}
    |> InventoryMovement.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory_movement.

  ## Examples

      iex> update_inventory_movement(inventory_movement, %{field: new_value})
      {:ok, %InventoryMovement{}}

      iex> update_inventory_movement(inventory_movement, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory_movement(%InventoryMovement{} = inventory_movement, attrs) do
    inventory_movement
    |> InventoryMovement.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory_movement.

  ## Examples

      iex> delete_inventory_movement(inventory_movement)
      {:ok, %InventoryMovement{}}

      iex> delete_inventory_movement(inventory_movement)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory_movement(%InventoryMovement{} = inventory_movement) do
    Repo.delete(inventory_movement)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory_movement changes.

  ## Examples

      iex> change_inventory_movement(inventory_movement)
      %Ecto.Changeset{data: %InventoryMovement{}}

  """
  def change_inventory_movement(%InventoryMovement{} = inventory_movement, attrs \\ %{}) do
    InventoryMovement.changeset(inventory_movement, attrs)
  end
end

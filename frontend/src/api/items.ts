import { api } from "./client";
import type { Item } from "../utils/types";

export function fetchItems() {
  return api<Item[]>("/items");
}

export function createItem(data: { name: string; sku: string; unit: string }) {
  return api<Item>("/items", {
    method: "POST",
    body: JSON.stringify(data),
  });
}

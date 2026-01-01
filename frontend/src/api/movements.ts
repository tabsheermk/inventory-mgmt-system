import { api } from "./client";
import type { Movement } from "../utils/types";

export function createMovement(data: {
  item_id: string;
  quantity: number;
  movement_type: "in" | "out" | "adjustment";
}) {
  return api<Movement>("/inventory_movements", {
    method: "POST",
    body: JSON.stringify(data),
  });
}

export function fetchMovements(itemId: string) {
  return api<{ data: Movement[] }>(`/items/${itemId}/movements`).then(
    (res) => res.data
  );
}

import { useEffect, useState } from "react";
import { fetchMovements } from "../api/movements";
import type { Movement } from "../utils/types";

export function MovementHistory({ itemId }: { itemId: string }) {
  const [movements, setMovements] = useState<Movement[]>([]);

  useEffect(() => {
    fetchMovements(itemId).then(setMovements);
  }, [itemId]);

  return (
    <ul className="text-sm border rounded divide-y">
      {movements.map((m) => (
        <li key={m.id} className="p-2 flex justify-between">
          <span>{m.movement_type}</span>
          <span>{m.quantity}</span>
          <span className="text-gray-500">{m.inserted_at}</span>
        </li>
      ))}
    </ul>
  );
}

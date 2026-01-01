import { useState } from "react";
import { createMovement } from "../api/movements";

export function MovementForm({ itemId }: { itemId: string }) {
  const [quantity, setQuantity] = useState(0);
  const [type, setType] = useState<"in" | "out" | "adjustment">("in");
  const [error, setError] = useState<string | null>(null);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    try {
      await createMovement({ item_id: itemId, quantity, movement_type: type });
      setQuantity(0);
      setError(null);
    } catch (err: any) {
      setError(err.message ?? "An unexpected error occurred");
    }
  }

  return (
    <form onSubmit={submit} className="flex gap-2 items-center">
      <input
        type="number"
        className="border rounded px-2 py-1 w-24"
        value={quantity}
        onChange={(e) => setQuantity(Number(e.target.value))}
      />
      <select
        className="border rounded px-2 py-1"
        value={type}
        onChange={(e) => setType(e.target.value as any)}
      >
        <option value="in">IN</option>
        <option value="out">OUT</option>
        <option value="adjustment">ADJUSTMENT</option>
      </select>
      <button className="bg-blue-600 text-white px-3 rounded">Record</button>
      {error && <span className="text-red-600 text-sm">{error}</span>}
    </form>
  );
}

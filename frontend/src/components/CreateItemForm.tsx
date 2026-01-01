import { useState } from "react";
import { createItem } from "../api/items";

export function CreateItemForm({ onCreated }: { onCreated: () => void }) {
  const [name, setName] = useState("");
  const [sku, setSku] = useState("");
  const [unit, setUnit] = useState("pcs");

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    await createItem({ name, sku, unit });
    setName("");
    setSku("");
    onCreated();
  }

  return (
    <form onSubmit={submit} className="flex gap-2">
      <input
        className="border rounded px-2 py-1 flex-1"
        placeholder="Name"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        className="border rounded px-2 py-1"
        placeholder="SKU"
        value={sku}
        onChange={(e) => setSku(e.target.value)}
      />
      <select
        className="border rounded px-2 py-1"
        value={unit}
        onChange={(e) => setUnit(e.target.value)}
      >
        <option value="pcs">pcs</option>
        <option value="kg">kg</option>
        <option value="litre">litre</option>
      </select>
      <button className="bg-black text-white px-4 rounded">Add</button>
    </form>
  );
}

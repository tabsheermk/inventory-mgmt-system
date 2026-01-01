import { useEffect, useState } from "react";
import { fetchItems } from "../api/items";
import type { Item } from "../utils/types";

export function ItemList({ onSelect }: { onSelect: (id: string) => void }) {
  const [items, setItems] = useState<Item[]>([]);

  useEffect(() => {
    fetchItems().then(setItems);
  }, []);

  return (
    <div className="border rounded">
      <table className="w-full text-sm">
        <thead className="bg-gray-100">
          <tr>
            <th className="p-2 text-left">Name</th>
            <th className="p-2">SKU</th>
            <th className="p-2">Stock</th>
            <th className="p-2">Movements</th>
          </tr>
        </thead>
        <tbody>
          {items
            .filter((item) => item.stock >= 0)
            .sort((a, b) => b.stock - a.stock)
            .map((item) => (
              <tr key={item.id} className="border-t">
                <td className="p-2 text-left">{item.name}</td>
                <td className="p-2 text-center">{item.sku}</td>
                <td className="p-2 text-center">
                  {item.stock} {item.unit}
                </td>
                <td className="p-2 text-center">
                  <button
                    className="text-blue-600 hover:underline"
                    onClick={() => onSelect(item.id)}
                  >
                    View
                  </button>
                </td>
              </tr>
            ))}
        </tbody>
      </table>
    </div>
  );
}

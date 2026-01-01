import { useState } from "react";
import { ItemList } from "../components/ItemList";
import { CreateItemForm } from "../components/CreateItemForm";
import { ItemDetailPage } from "./ItemDetailPage";

export function ItemsPage() {
  const [selectedItem, setSelectedItem] = useState<string | null>(null);
  const [refresh, setRefresh] = useState(0);

  return (
    <div className="p-6 max-w-4xl mx-auto space-y-6">
      <h1 className="text-xl font-semibold">Inventory Management System</h1>

      <CreateItemForm onCreated={() => setRefresh((r) => r + 1)} />

      <ItemList key={refresh} onSelect={setSelectedItem} />

      {selectedItem && <ItemDetailPage itemId={selectedItem} />}
    </div>
  );
}

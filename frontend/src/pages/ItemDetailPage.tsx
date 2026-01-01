import { MovementForm } from "../components/MovementForm";
import { MovementHistory } from "../components/MovementHistory";

export function ItemDetailPage({ itemId }: { itemId: string }) {
  return (
    <div className="border rounded p-4 space-y-4">
      <h2 className="font-medium">Item Movements</h2>
      <MovementForm itemId={itemId} />
      <MovementHistory itemId={itemId} />
    </div>
  );
}

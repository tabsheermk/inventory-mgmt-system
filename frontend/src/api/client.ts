const API_URL = "http://localhost:4000/api";

export async function api<T>(path: string, options?: RequestInit): Promise<T> {
  const res = await fetch(`${API_URL}${path}`, {
    headers: { "Content-Type": "application/json" },
    ...options,
  });

  if (!res.ok) {
    const body = await res.json();
    throw new Error(body.error || "Request failed");
  }

  return res.json();
}

defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
  end

  # -------- API ROUTES (FIRST) --------
  scope "/api", BackendWeb do
    pipe_through :api

    post "/items", ItemController, :create
    get "/items", ItemController, :get_items

    post "/inventory_movements", InventoryMovementController, :create
    get "/items/:id/movements", InventoryMovementController, :index
  end

  # -------- SPA CATCH-ALL (LAST) --------
  scope "/", BackendWeb do
    pipe_through :browser
    get "/*path", PageController, :index
  end

  # Dev tools (unchanged)
  if Application.compile_env(:backend, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BackendWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

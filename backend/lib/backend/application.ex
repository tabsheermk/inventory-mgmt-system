defmodule Backend.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BackendWeb.Telemetry,
      Backend.Repo,
      {DNSCluster, query: Application.get_env(:backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Backend.PubSub},
      BackendWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Backend.Supervisor]

    {:ok, pid} = Supervisor.start_link(children, opts)

    # Run migrations AFTER Repo is started
    if System.get_env("RUN_MIGRATIONS") == "true" do
      Backend.Release.migrate()
    end

    {:ok, pid}
  end

  @impl true
  def config_change(changed, _new, removed) do
    BackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

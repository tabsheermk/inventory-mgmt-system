defmodule Backend.Release do
  def migrate do
    Application.load(:backend)

    for repo <- Application.fetch_env!(:backend, :ecto_repos) do
      Ecto.Migrator.run(repo, :up, all: true)
    end
  end
end

defmodule WebScrape.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :url,   :string, size: 1024
      add :title, :string,  size: 1024

      timestamps()
    end

  end
end

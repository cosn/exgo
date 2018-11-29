defmodule ExGo.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :name, :string
      add :url, :string

      timestamps()
    end

    create unique_index(:links, [:name])
    create unique_index(:links, [:url])
  end
end

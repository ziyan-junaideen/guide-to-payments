defmodule Core.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :text
      add :slug, :text
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end

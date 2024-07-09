defmodule Core.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add :title, :text
      add :slug, :text
      add :views, :integer
      add :body, :text

      timestamps(type: :utc_datetime)
    end
  end
end

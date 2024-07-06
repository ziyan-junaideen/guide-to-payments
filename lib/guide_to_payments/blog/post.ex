defmodule Core.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def create_changeset(post, attrs) do
    post
    |> slug_changeset(attrs)
    |> cast(attrs, [:title, :slug, :views, :body])
    |> validate_required([:title, :slug, :views, :body])
  end

  def update_changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :views, :body])
    |> validate_required([:title, :slug, :views, :body])
  end

  def slug_changeset(post, attrs) do
    post
    |> cast(attrs, [:slug])
    |> put_change(:slug, Parameterize.parameterize(attrs[:slug]))
    |> validate_required([:slug])
  end
end

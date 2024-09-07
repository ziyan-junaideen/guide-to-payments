defmodule Core.Blog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :description, :string
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @type t() :: %__MODULE__{}

  @doc """
  Changeset to create a category
  """
  @spec create_changeset(t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def create_changeset(category, attrs) do
    category
    |> put_change(:slug, Utilities.String.sluggify(attrs["name"]))
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :slug, :description])
  end

  @doc """
  Changeset to update a category. This will not change the slug.
  """
  @spec update_changeset(t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def update_changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end

  @doc """
  Changeset to change the slug. We shouldn't be changing the slug as it may impact SEO.
  """
  @spec slug_changeset(t() | Ecto.Changeset.t()) :: Ecto.Changeset.t()
  def slug_changeset(category) do
    category
    |> change(%{})
    |> put_change(:slug, Utilities.String.sluggify(category.name))
    |> validate_required([:slug])
  end
end

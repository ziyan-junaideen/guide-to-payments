defmodule CoreWeb.PostsLive do
  use CoreWeb, :live_view

  import Ecto.Query

  @impl Phoenix.LiveView
  def handle_params(params, _uri, socket) do
    page = params["page"] || 1
    per_page = 10

    posts =
      Core.Repo.all(
        from post in Core.Blog.Post, limit: ^per_page, offset: (^page - 1) * ^per_page
      )

    socket
    |> assign(:title, "Blog Posts")
    |> assign(:current_page, "posts")
    |> assign(:posts, posts)
    |> (&{:noreply, &1}).()
  end
end

defmodule CoreWeb.PostLive do
  use CoreWeb, :live_view

  import Ecto.Query

  @impl Phoenix.LiveView
  def handle_params(%{"slug" => slug}, _uri, socket) do
    post = Core.Repo.one!(from post in Core.Blog.Post, where: post.slug == ^slug)

    socket
    |> assign(:title, post.title)
    |> assign(:current_page, "post")
    |> assign(:post, post)
    |> (&{:noreply, &1}).()
  end
end

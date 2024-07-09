defmodule CoreWeb.AdminPostsLive do
  use CoreWeb, {:live_view, layout: :admin}
  import Ecto.Query

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Welcome to the Admin Blog Posts</h1>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Views</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <%= for post <- @posts do %>
          <tr>
            <td><%= post.title %></td>
            <td><%= post.views %></td>
            <td>
              <.link href={~p"/admin/posts/#{post.id}/edit"}>Edit</.link>
              <.link href={~p"/posts/#{post.slug}"}>View</.link>
            </td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  @impl Phoenix.LiveView
  def handle_params(params, _uri, socket) do
    page = params["page"] || 1
    per_page = 10

    posts =
      Core.Repo.all(
        from post in Core.Blog.Post, limit: ^per_page, offset: (^page - 1) * ^per_page
      )

    socket
    |> assign(:title, "Admin Blog Posts")
    |> assign(:current_page, "admin_posts")
    |> assign(:posts, posts)
    |> (&{:noreply, &1}).()
  end
end

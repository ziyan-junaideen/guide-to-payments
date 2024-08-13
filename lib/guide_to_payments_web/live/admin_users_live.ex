defmodule CoreWeb.AdminUsersLive do
  use CoreWeb, {:live_view, layout: :admin}
  import Ecto.Query

  @impl Phoenix.LiveView
  def handle_params(params, _uri, socket) do
    page = params["page"] || 1
    per_page = 10

    users =
      Core.Repo.all(
        from post in Core.Accounts.User, limit: ^per_page, offset: (^page - 1) * ^per_page
      )

    socket
    |> assign(:title, "Admin Users")
    |> assign(:current_page, "admin_users")
    |> assign(:posts, users)
    |> (&{:noreply, &1}).()
  end
end

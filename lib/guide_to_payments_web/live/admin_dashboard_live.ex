defmodule CoreWeb.AdminDashboardLive do
  use CoreWeb, {:live_view, layout: :admin}

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Welcome to the Admin Dashboard</h1>
    """
  end

  @impl Phoenix.LiveView
  def handle_params(_params, _url, socket) do
    socket
    |> assign(:current_page, "dkk")
    |> (&{:noreply, &1}).()
  end
end

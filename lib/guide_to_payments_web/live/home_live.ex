defmodule CoreWeb.HomeLive do
  use CoreWeb, :live_view

  def mount(_params, _session, socket) do
    socket
    |> assign(:title, "Welcome to Guide to Payments")
    |> assign(:current_page, "home")
    |> (&{:ok, &1}).()
  end
end

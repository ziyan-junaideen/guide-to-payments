defmodule CoreWeb.HomeLive do
  use CoreWeb, :live_view

  def mount(_params, _session, socket) do
    socket
    |> assign(:page_title, "Welcome to your GuideToPayments")
    |> assign(:current_page, "home")
    |> (&{:ok, &1}).()
  end
end

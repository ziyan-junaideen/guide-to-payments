defmodule CoreWeb.HomeLive do
  use CoreWeb, :live_view

  def mound(_params, _session, socket) do
    socket
    |> assign(:title, "Welcome to Guide to Payments")
    |> (&{:ok, &1}).()
  end
end

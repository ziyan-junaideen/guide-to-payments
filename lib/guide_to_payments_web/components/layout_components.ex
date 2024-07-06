defmodule CoreWeb.LayoutComponents do
  @moduledoc """
  Provide Layout related components
  """

  use Phoenix.Component

  attr :href, :string, default: "#"
  attr :active, :boolean, default: false
  slot :inner_block, required: true

  def nav_link(assigns) do
    ~H"""
    <div class="text-blue"></div>
    <.link
      href={@href}
      class={[
        "block py-2 px-3 rounded md:bg-transparent md:p-0",
        @active && "bg-blue-700 text-blue-700 dark:text-blue-500",
        !@active &&
          "text-gray-900 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700"
      ]}
      aria-current={@active && "page"}
    >
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end
end

defmodule Utilities.String do
  def sluggify(text) when is_binary(text) do
    text
    |> String.downcase()
    |> String.trim()
    |> String.normalize(:nfd)
    |> String.replace(~r/[^a-z0-9\s-]/u, "  ")
    |> String.replace(~r/[\s-]+/, "-", global: true)
    |> String.replace(~r/\s+/, "-")
  end
end

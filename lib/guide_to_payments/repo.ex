defmodule Core.Repo do
  use Ecto.Repo,
    otp_app: :guide_to_payments,
    adapter: Ecto.Adapters.Postgres
end

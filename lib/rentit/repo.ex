defmodule Rentit.Repo do
  use Ecto.Repo,
    otp_app: :rentit,
    adapter: Ecto.Adapters.Postgres
end

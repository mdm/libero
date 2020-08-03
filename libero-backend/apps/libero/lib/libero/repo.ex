defmodule Libero.Repo do
  use Ecto.Repo,
    otp_app: :libero,
    adapter: Ecto.Adapters.Postgres
end

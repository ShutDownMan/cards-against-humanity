defmodule JacahBackend.Repo do
  use Ecto.Repo,
    otp_app: :jacah_backend,
    adapter: Ecto.Adapters.Postgres
end

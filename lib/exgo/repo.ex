defmodule ExGo.Repo do
  use Ecto.Repo,
    otp_app: :exgo,
    adapter: Ecto.Adapters.Postgres
end

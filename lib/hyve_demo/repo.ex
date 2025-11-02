defmodule HyveDemo.Repo do
  use Ecto.Repo,
    otp_app: :hyve_demo,
    adapter: Ecto.Adapters.Postgres
end

defmodule SolarGuitarStore.Repo do
  use Ecto.Repo,
    otp_app: :solar_guitar_store,
    adapter: Ecto.Adapters.Postgres
end

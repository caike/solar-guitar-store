defmodule SolarGuitarStoreWeb.Api.V1.GuitarController do
  use SolarGuitarStoreWeb, :controller

  def index(conn, _params) do
    json(conn, :ok)
  end
end

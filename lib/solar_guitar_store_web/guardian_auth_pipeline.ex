defmodule SolarGuitarStoreWeb.GuardianAuthPipeline do
  @moduledoc """
  This module handles the authentication pipeline
  """
  use Guardian.Plug.Pipeline,
    otp_app: :solar_guitar_Store,
    module: SolarGuitarStoreWeb.Guardian,
    error_handler: SolarGuitarStoreWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end

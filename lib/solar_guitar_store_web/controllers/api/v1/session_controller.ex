defmodule SolarGuitarStoreWeb.Api.V1.SessionController do
  use SolarGuitarStoreWeb, :controller

  alias SolarGuitarStore.Accounts
  alias SolarGuitarStoreWeb.Guardian

  def create(conn, %{"email" => email, "password" => password} = _params) do
    with {:ok, user} <- valid_user(email, password),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> json(%{"jwt" => token})
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> json("invalid credentials")
    end
  end

  defp valid_user(email, password) do
    if user = Accounts.get_user_by_email_and_password(email, password) do
      {:ok, user}
    else
      {:error, :invalid_user}
    end
  end
end

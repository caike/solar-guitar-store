defmodule SolarGuitarStoreWeb.Api.V1.SessionControllerTest do
  @moduledoc """
  This module tests the authentication via API
  """
  use SolarGuitarStoreWeb.ConnCase

  import SolarGuitarStore.AccountsFixtures

  setup do
    password = valid_user_password()
    user = user_fixture(%{password: password})

    %{email: user.email, password: password}
  end

  test "Valid login", %{conn: conn, email: email, password: password} do
    conn = conn |> post("/api/v1/session", %{email: email, password: password})

    assert json_response(conn, :ok)["jwt"]
  end

  test "Invalid login", %{conn: conn, email: email, password: password} do
    conn =
      conn
      |> post("/api/v1/session", %{email: email, password: password <> "bla"})

    assert json_response(conn, :unauthorized)
  end
end

defmodule SolarGuitarStoreWeb.Api.V1.GuitarControllerTest do
  use SolarGuitarStoreWeb.ConnCase

  import SolarGuitarStore.AccountsFixtures
  alias SolarGuitarStoreWeb.Guardian

  describe "Unauthenticated" do
    test "List all guitars", %{conn: conn} do
      conn = conn |> get("/api/v1/guitars")

      assert json_response(conn, :unauthorized)
    end
  end

  describe "Authenticated" do
    setup %{conn: conn} do
      user = user_fixture()

      {:ok, jwt, _claims} = Guardian.encode_and_sign(user)

      conn =
        conn
        |> put_req_header("accept", "application/json")
        |> put_req_header("authorization", "Bearer #{jwt}")

      {:ok, conn: conn}
    end

    test "List all guitars", %{conn: conn} do
      conn = conn |> get("/api/v1/guitars")

      assert json_response(conn, :ok)
    end
  end
end

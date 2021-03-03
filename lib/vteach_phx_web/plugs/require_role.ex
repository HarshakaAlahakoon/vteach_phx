defmodule VteachPhxWeb.Plugs.RequireRole do
  use VteachPhxWeb, :controller
  alias VteachPhx.Accounts.Guardian

  def init(options) do
    options
  end

  def call(conn, opts) do
    resource = Guardian.Plug.current_resource(conn)

    with false <- !resource, true <- Enum.member?(opts, resource.role) do
      conn
    else
      _ ->
        conn
        |> put_status(:bad_request)
        |> send_resp(401, Jason.encode!(%{error: "Unauthorized"}))
        |> halt()
    end
  end
end

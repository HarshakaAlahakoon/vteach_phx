defmodule VteachPhx.AuthErrorHandler do
  import Plug.Conn

  require Logger

  def auth_error(conn, {type, reason}, _opts) do
    Logger.error("Auth error: #{inspect(reason)}")
    body = Jason.encode!(%{error: to_string(type)})
    send_resp(conn, 401, body)
  end
end

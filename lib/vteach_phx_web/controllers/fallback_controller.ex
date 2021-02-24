defmodule VteachPhxWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use VteachPhxWeb, :controller

  require Logger

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(VteachPhxWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, error_content}) do
    Logger.error("#{inspect(error_content)}")
    conn
    |> put_status(422)
    |> put_view(VteachPhxWeb.ErrorView)
    |> render(:"422")
  end

  def call(conn, error) do
    Logger.error("#{inspect(error)}")
    conn
    |> put_status(500)
    |> put_view(VteachPhxWeb.ErrorView)
    |> render(:"500")
  end
end

defmodule VteachPhxWeb.AuthController do
  use VteachPhxWeb, :controller

  alias VteachPhx.Accounts.Session
  alias VteachPhx.Accounts.Guardian

  action_fallback VteachPhxWeb.FallbackController

  def sign_in(conn, %{"user" => user_params}) do
    case Session.authenticate(user_params) do
      {:ok, user} ->
        {:ok, jwt, claims} = Guardian.encode_and_sign(user)
        IO.inspect(claims, label: "\n#{__MODULE__} :: authenticate >> claims\n")
        resp = %{:succes => true, :error_message => "SUCCESS", :token => jwt}
        conn |> render("sign_in_jwt.json", response: resp)
      _ ->
        resp = %{:succes => false, :error_message => "ERROR"}
        conn |> render("sign_in_succes.json", response: resp)
    end
  end

end

defmodule VteachPhxWeb.AuthController do

  use VteachPhxWeb, :controller

  alias VteachPhx.Accounts.Session
  alias VteachPhx.Accounts.Guardian

  action_fallback VteachPhxWeb.FallbackController

  def sign_in(conn, %{"user" => user_params}) do
    case Session.authenticate(user_params) do
      {:ok, user} ->
        additional_claims = %{
          username: user.username
        }
        {:ok, jwt, _claims} = Guardian.encode_and_sign(user, additional_claims)
        resp = %{:succes => true, :error_message => "SUCCESS", :token => jwt}
        conn |> render("sign_in_jwt.json", response: resp)
      {:error, :invalid_credentials} ->
        resp = %{:succes => false, :error_message => "Invalid username or password"}
        conn
        |> put_status(400)
        |> render("sign_in_failed.json", response: resp)
    end
  end

end

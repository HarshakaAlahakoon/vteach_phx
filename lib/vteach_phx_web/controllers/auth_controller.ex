defmodule VteachPhxWeb.AuthController do
  use VteachPhxWeb, :controller

  alias VteachPhx.Accounts
  alias VteachPhx.Accounts.Auth
  alias VteachPhx.Accounts.User
  alias VteachPhx.Accounts.Session

  action_fallback VteachPhxWeb.FallbackController

  # def index(conn, _params) do
  #   auth = Accounts.list_auth()
  #   render(conn, "index.json", auth: auth)
  # end

  def sign_in(conn, %{"user" => user_params}) do
    # with {:ok, %Auth{} = auth} <- Accounts.create_auth(auth_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.auth_path(conn, :show, auth))
    #   |> render("login_succes.json", auth: auth)
    # end

    # auth_result = Session.authenticate(user_params)
    # resp = %{:succes => true, :error_message => "SUCCES"}

    case Session.authenticate(user_params) do
      {:ok, token} ->
        resp = %{:succes => true, :error_message => "SUCCESS", :token => token}
        conn |> render("sign_in_jwt.json", response: resp)
      _ ->
        resp = %{:succes => false, :error_message => "ERROR"}
        conn |> render("sign_in_succes.json", response: resp)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   auth = Accounts.get_auth!(id)
  #   render(conn, "show.json", auth: auth)
  # end

  # def update(conn, %{"id" => id, "auth" => auth_params}) do
  #   auth = Accounts.get_auth!(id)

  #   with {:ok, %Auth{} = auth} <- Accounts.update_auth(auth, auth_params) do
  #     render(conn, "show.json", auth: auth)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   auth = Accounts.get_auth!(id)

  #   with {:ok, %Auth{}} <- Accounts.delete_auth(auth) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end

defmodule VteachPhxWeb.UserController do
  use VteachPhxWeb, :controller

  alias VteachPhx.Accounts
  alias VteachPhx.Accounts.User
  alias VteachPhxWeb.Plugs.RequireRole

  action_fallback VteachPhxWeb.FallbackController

  plug RequireRole, ["admin1"] when action in [:index, :show]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with true <- user_params["password"] === user_params["password_validate"],
      %{password_hash: password_hash} <- User.hash_password(user_params["password"]),
      {:ok, %User{} = user} <- Accounts.create_user(Map.put(user_params, "password_hash", password_hash)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end

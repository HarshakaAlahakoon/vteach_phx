defmodule VteachPhxWeb.UserController do

  use VteachPhxWeb, :controller

  alias VteachPhx.Accounts
  alias VteachPhx.Accounts.User
  alias VteachPhxWeb.Plugs.RequireRole

  require Logger

  action_fallback VteachPhxWeb.FallbackController

  plug RequireRole, ["admin"] when action in [:index, :show]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    else
      {:error, %Ecto.Changeset{errors: errors}} ->
        error_list = convert_changeset_errors(errors)
        render(conn, "creation_failed.json", errors: error_list)
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

  # TODO: This function will be needed by other controllers/views, therefore, move this to a utility module.
  defp convert_changeset_errors(errors) do
    Enum.map(errors, fn {field, {message, values}} ->
      message1 = List.foldl(values, message, fn (y, acc) ->
        {key, value} = y
          String.replace(acc, "%{#{key}}", "#{value}", global: true)
        end
      )
     {field, message1}
    end)
  end

end

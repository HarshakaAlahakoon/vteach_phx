defmodule VteachPhxWeb.UserInstituteController do
  use VteachPhxWeb, :controller

  alias VteachPhx.Teaching
  alias VteachPhx.Teaching.UserInstitute

  action_fallback VteachPhxWeb.FallbackController

  def index(conn, _params) do
    user_institute = Teaching.list_user_institutes()
    render(conn, "index.json", user_institute: user_institute)
  end

  def create(conn, %{"user_institute" => user_institute_params}) do
    with {:ok, %UserInstitute{} = user_institute} <-
           Teaching.create_user_institute(user_institute_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_institute_path(conn, :show, user_institute))
      |> render("show.json", user_institute: user_institute)
    end
  end

  def show(conn, %{"id" => id}) do
    user_institute = Teaching.get_user_institute!(id)
    render(conn, "show.json", user_institute: user_institute)
  end

  def update(conn, %{"id" => id, "user_institute" => user_institute_params}) do
    user_institute = Teaching.get_user_institute!(id)

    with {:ok, %UserInstitute{} = user_institute} <-
           Teaching.update_user_institute(user_institute, user_institute_params) do
      render(conn, "show.json", user_institute: user_institute)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_institute = Teaching.get_user_institute!(id)

    with {:ok, %UserInstitute{}} <- Teaching.delete_user_institute(user_institute) do
      send_resp(conn, :no_content, "")
    end
  end
end

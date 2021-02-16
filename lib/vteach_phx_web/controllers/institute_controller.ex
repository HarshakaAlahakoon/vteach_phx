defmodule VteachPhxWeb.InstituteController do
  use VteachPhxWeb, :controller

  alias VteachPhx.Teaching
  alias VteachPhx.Teaching.Institute

  action_fallback VteachPhxWeb.FallbackController

  def index(conn, _params) do
    institutes = Teaching.list_institutes()
    render(conn, "index.json", institutes: institutes)
  end

  def create(conn, %{"institute" => institute_params}) do
    with {:ok, %Institute{} = institute} <- Teaching.create_institute(institute_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.institute_path(conn, :show, institute))
      |> render("show.json", institute: institute)
    end
  end

  def show(conn, %{"id" => id}) do
    institute = Teaching.get_institute!(id)
    render(conn, "show.json", institute: institute)
  end

  def update(conn, %{"id" => id, "institute" => institute_params}) do
    institute = Teaching.get_institute!(id)

    with {:ok, %Institute{} = institute} <- Teaching.update_institute(institute, institute_params) do
      render(conn, "show.json", institute: institute)
    end
  end

  def delete(conn, %{"id" => id}) do
    institute = Teaching.get_institute!(id)

    with {:ok, %Institute{}} <- Teaching.delete_institute(institute) do
      send_resp(conn, :no_content, "")
    end
  end
end

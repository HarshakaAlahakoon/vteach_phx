defmodule VteachPhxWeb.UserInstitutesControllerTest do
  use VteachPhxWeb.ConnCase

  alias VteachPhx.Teaching
  alias VteachPhx.Teaching.UserInstitutes

  @create_attrs %{
    password: "some password",
    user_id: "some user_id"
  }
  @update_attrs %{
    password: "some updated password",
    user_id: "some updated user_id"
  }
  @invalid_attrs %{password: nil, user_id: nil}

  def fixture(:user_institutes) do
    {:ok, user_institutes} = Teaching.create_user_institutes(@create_attrs)
    user_institutes
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_institutes", %{conn: conn} do
      conn = get(conn, Routes.user_institutes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_institutes" do
    test "renders user_institutes when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.user_institutes_path(conn, :create), user_institutes: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_institutes_path(conn, :show, id))

      assert %{
               "id" => id,
               "password" => "some password",
               "user_id" => "some user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.user_institutes_path(conn, :create), user_institutes: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_institutes" do
    setup [:create_user_institutes]

    test "renders user_institutes when data is valid", %{
      conn: conn,
      user_institutes: %UserInstitutes{id: id} = user_institutes
    } do
      conn =
        put(conn, Routes.user_institutes_path(conn, :update, user_institutes),
          user_institutes: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_institutes_path(conn, :show, id))

      assert %{
               "id" => id,
               "password" => "some updated password",
               "user_id" => "some updated user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_institutes: user_institutes} do
      conn =
        put(conn, Routes.user_institutes_path(conn, :update, user_institutes),
          user_institutes: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_institutes" do
    setup [:create_user_institutes]

    test "deletes chosen user_institutes", %{conn: conn, user_institutes: user_institutes} do
      conn = delete(conn, Routes.user_institutes_path(conn, :delete, user_institutes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_institutes_path(conn, :show, user_institutes))
      end
    end
  end

  defp create_user_institutes(_) do
    user_institutes = fixture(:user_institutes)
    %{user_institutes: user_institutes}
  end
end

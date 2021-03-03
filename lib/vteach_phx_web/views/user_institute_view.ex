defmodule VteachPhxWeb.UserInstituteView do
  use VteachPhxWeb, :view
  alias VteachPhxWeb.UserInstituteView

  def render("index.json", %{user_institute: user_institute}) do
    %{data: render_many(user_institute, UserInstituteView, "user_institute.json")}
  end

  def render("show.json", %{user_institute: user_institute}) do
    %{data: render_one(user_institute, UserInstituteView, "user_institute.json")}
  end

  def render("user_institute.json", %{user_institute: user_institute}) do
    %{
      user_id: user_institute.user_id,
      institute_id: user_institute.institute_id
    }
  end
end

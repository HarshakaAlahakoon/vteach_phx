defmodule VteachPhxWeb.UserView do
  use VteachPhxWeb, :view
  alias VteachPhxWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email
    }
  end

  def render("creation_failed.json", %{errors: errors}) do
    %{
      succes: false,
      errors: Enum.into(errors, %{})
    }
  end
end

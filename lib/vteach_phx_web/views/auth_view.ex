defmodule VteachPhxWeb.AuthView do
  use VteachPhxWeb, :view
  alias VteachPhxWeb.AuthView

  def render("index.json", %{auth: auth}) do
    %{data: render_many(auth, AuthView, "auth.json")}
  end

  def render("show.json", %{auth: auth}) do
    %{data: render_one(auth, AuthView, "auth.json")}
  end

  def render("auth.json", %{auth: auth}) do
    %{id: auth.id,
      email: auth.email,
      password: auth.password}
  end

  # def render("login_succes.json", %{auth: auth}) do
  def render("sign_in_succes.json", %{response: resp}) do
    %{
      # id: auth.id,
      # email: auth.email
      succes: resp.succes,
      error_message: resp.error_message
    }
  end
end

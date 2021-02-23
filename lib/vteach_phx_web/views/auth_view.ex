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

  def render("sign_in_jwt.json", %{response: resp}) do
    %{
      succes: resp.succes,
      error_message: resp.error_message,
      token: resp.token
    }
  end

  def render("sign_in_failed.json", %{response: resp}) do
    %{
      succes: resp.succes,
      error_message: resp.error_message
    }
  end
end

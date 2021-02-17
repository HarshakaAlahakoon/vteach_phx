defmodule VteachPhx.Accounts.Session do
  alias VteachPhx.Accounts
  alias Comeonin

  def authenticate(%{"email" => email, "password" => password} = _args) do
    user = Accounts.get_user_by_email(email)
    check_password(user, password)
  end

  def check_password(user, password) do
    case user do
      nil ->
        false
      _ ->
        Argon2.check_pass(user, password, [hash_key: :password])
    end
  end

end

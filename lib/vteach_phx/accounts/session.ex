defmodule VteachPhx.Accounts.Session do
  alias VteachPhx.Accounts
  alias Comeonin

  def authenticate(%{"email" => email, "password" => password} = _args) do
    with user <- Accounts.get_user_by_email(String.downcase(email)),
      {:ok, user} <- check_password(user, password) do
        {:ok, user}
      else
        _error ->
            {:error, :invalid_credentials}
      end
  end

  def check_password(user, password) do
    case user do
      nil ->
        Argon2.no_user_verify()
      _ ->
        Argon2.check_pass(user, password, [hash_key: :password_hash])
    end
  end

end

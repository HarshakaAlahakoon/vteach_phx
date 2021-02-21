defmodule VteachPhx.Accounts.Session do
  alias VteachPhx.Accounts
  alias Comeonin
  alias VteachPhx.Accounts.Guardian

  def authenticate(%{"email" => email, "password" => password} = _args) do
    with user <- Accounts.get_user_by_email(String.downcase(email)),
      {:ok, user} <- check_password(user, password) do
        {:ok, jwt, claims} = Guardian.encode_and_sign(user)
        IO.inspect(claims, label: "\n#{__MODULE__} :: authenticate >> claims\n")
        {:ok, jwt}
      else
        _ ->
          {:error, "Authentication failed"}
      end
  end

  def check_password(user, password) do
    case user do
      nil ->
        Argon2.no_user_verify()
      _ ->
        Argon2.check_pass(user, password, [hash_key: :password])
    end
  end

end

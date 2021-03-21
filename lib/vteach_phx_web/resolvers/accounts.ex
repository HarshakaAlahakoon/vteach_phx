defmodule VteachPhxWeb.Resolvers.Accounts do
  alias VteachPhx.Accounts
  alias VteachPhx.Accounts.Session
  alias VteachPhx.Accounts.Guardian

  def user_login(_, %{input: params}, _) do
    case Session.authenticate(params) do
      {:ok, user} ->
        additional_claims = %{
          username: user.username
        }

        {:ok, jwt, _claims} = Guardian.encode_and_sign(user, additional_claims)

        {:ok, %{success: true, token: jwt}}

      {:error, :invalid_credentials} ->
        {:error, %{succes: false, message: "Invalid username or password"}}
    end
  end

  def list_users(_, _, _) do
    {:ok, Accounts.list_users()}
  end
end

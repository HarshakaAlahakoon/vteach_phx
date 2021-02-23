defmodule VteachPhx.Accounts.Guardian do

  use Guardian, otp_app: :vteach_phx

  alias VteachPhx.Accounts.User
  alias VteachPhx.Accounts

  require Logger

  def subject_for_token(%User{:id => id}, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(id)
    {:ok, sub}
  end
  def subject_for_token(input, _) do
    # TODO:
    Logger.error("Unknown input: #{inspect(input)}")
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => sub}) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    user = Accounts.get_user!(sub)
    {:ok, user}
  end
  def resource_from_claims(claims) do
    # TODO:
    Logger.error("Sub not found in: #{inspect(claims)}")
    {:error, :resource_not_found}
  end

end

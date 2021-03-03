defmodule VteachPhx.Teaching.UserInstitute do
  use Ecto.Schema
  import Ecto.Changeset
  alias VteachPhx.Accounts.User
  alias VteachPhx.Teaching.Institute

  schema "user_institutes" do
    belongs_to(:user, User)
    belongs_to(:institute, Institute)

    timestamps()
  end

  @doc false
  def changeset(user_institute, attrs) do
    user_institute
    |> cast(attrs, [:user_id, :institute_id])
    |> validate_required([:user_id, :institute_id])
  end
end

defmodule VteachPhx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
  end

  def hash_password(password) do
    Argon2.add_hash(password)
  end
end

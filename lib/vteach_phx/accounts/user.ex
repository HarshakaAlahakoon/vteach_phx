defmodule VteachPhx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_validate, :string, virtual: true
    field :password_hash, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :role])
    |> validate_required([:email, :password_hash])
  end

  def hash_password(password) do
    Argon2.add_hash(password)
  end
end

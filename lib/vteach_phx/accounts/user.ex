defmodule VteachPhx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin
  alias VteachPhx.Teaching.UserInstitute

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string, unique: true
    field :username, :string
    field :password, :string, virtual: true, redact: true
    field :password_confirmation, :string, virtual: true, redact: true
    field :password_hash, :string, redact: true
    field :role, :string
    has_many(:user_institute, UserInstitute)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password, :password_confirmation, :password_hash, :role])
    |> validate_required([:email, :password, :password_confirmation, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 3, max: 15)
    |> validate_confirmation(:password)
    |> unique_constraint(:email, name: :users_pkey)
    |> hash_password
  end

  def hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  def hash_password(changeset) do
    changeset
  end
end

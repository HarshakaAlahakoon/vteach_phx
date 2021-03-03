defmodule VteachPhx.Teaching.UserInstitute do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :user_id}
  @primary_key false
  schema "user_institute" do
    field :user_id, :binary_id
    field :institute_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(user_institute, attrs) do
    user_institute
    |> cast(attrs, [:user_id, :institute_id])
    |> validate_required([:user_id, :institute_id])
  end
end

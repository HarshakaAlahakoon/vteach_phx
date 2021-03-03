defmodule VteachPhx.Teaching.Institute do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "institutes" do
    field :name, :string
    field :address_line_1, :string
    field :address_line_2, :string
    field :district, :integer
    field :province, :integer
    field :phone, :string
    field :fax, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(institute, attrs) do
    institute
    |> cast(attrs, [
      :name,
      :address_line_1,
      :address_line_2,
      :district,
      :province,
      :phone,
      :fax,
      :email
    ])
    |> validate_required([
      :name,
      :address_line_1,
      :address_line_2,
      :district,
      :province,
      :phone,
      :fax,
      :email
    ])
  end
end

defmodule VteachPhx.Teaching.Institute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "institutes" do
    field :name, :string
    field :address_line_1, :string, default: ""
    field :address_line_2, :string, default: ""
    field :district, :integer, default: 0
    field :province, :integer, default: 0
    field :phone, :string, default: ""
    field :fax, :string, default: ""
    field :email, :string, default: ""

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
      :name
      # :address_line_1,
      # :address_line_2,
      # :district,
      # :province,
      # :phone,
      # :fax,
      # :email
    ])
  end
end

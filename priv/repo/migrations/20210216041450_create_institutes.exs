defmodule VteachPhx.Repo.Migrations.CreateInstitutes do
  use Ecto.Migration

  def change do
    create table(:institutes) do
      add :name, :string
      add :address_line_1, :string
      add :address_line_2, :string
      add :district, :integer
      add :province, :integer
      add :phone, :string
      add :fax, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:institutes, :name)
  end
end

defmodule VteachPhx.Repo.Migrations.CreateUserInstitute do
  use Ecto.Migration

  def change do
    create table(:user_institute, primary_key: false) do
      add :user_id, :binary_id
      add :institute_id, :binary_id

      timestamps()
    end

    create unique_index(:user_institute, [:user_id, :institute_id])
  end
end

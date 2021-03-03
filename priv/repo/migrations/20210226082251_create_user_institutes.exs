defmodule VteachPhx.Repo.Migrations.CreateUserInstitute do
  use Ecto.Migration

  def change do
    create table(:user_institutes) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :institute_id, references(:institutes, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:user_institutes, [:user_id, :institute_id])
  end
end

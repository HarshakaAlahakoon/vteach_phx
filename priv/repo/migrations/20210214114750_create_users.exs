defmodule VteachPhx.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, null: false
      add :email, :string, primary_key: true
      add :password, :string, null: false

      timestamps()
    end

  end
end

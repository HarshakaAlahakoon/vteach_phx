defmodule VteachPhxWeb.Schema do
  use Absinthe.Schema
  alias VteachPhx.{Accounts, Teaching}

  query do
    field :user_list, list_of(:user), description: "Admin, Teachers, Students & Parents" do
      resolve(fn _, _, _ ->
        {:ok, Accounts.list_users()}
      end)
    end

    field :user_institute_list, list_of(:user_institute), description: "Join table to map users with their respective institutes" do
      resolve(fn _, _, _ ->
        {:ok, Teaching.list_user_institutes()}
      end)
    end

    field :institute_list, list_of(:institute), description: "Institutes where classes are held" do
      resolve(fn _, _, _ ->
        {:ok, Teaching.list_institutes()}
      end)
    end
  end

  object :user do
    field :id, :id
    field :email, :string
    field :institutes, list_of(:institute)
  end

  object :user_institute do
    field :user_id, :id
    field :institute_id, :id
  end

  object :institute do
    field :id, :id
    field :name, :string
    field :email, :string
  end
end

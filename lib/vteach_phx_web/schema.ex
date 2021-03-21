defmodule VteachPhxWeb.Schema do
  use Absinthe.Schema
  alias VteachPhxWeb.Resolvers

  import_types(VteachPhxWeb.Schema.ContentTypes)

  query do
    field :user_list, list_of(:user), description: "Admin, Teachers, Students & Parents" do
      resolve(&Resolvers.Accounts.list_users/3)
    end

    field :institute_list, list_of(:institute), description: "Institutes where classes are held" do
      resolve(&Resolvers.Teaching.list_institute/3)
    end

    field :user_institute_list, list_of(:user_institute),
      description: "Join table to map users with their respective institutes" do
      resolve(&Resolvers.Teaching.list_user_institutes/3)
    end
  end

  mutation do
    @desc "Login user"
    field :user_login, :login_result do
      arg(:input, non_null(:login_input))
      resolve(&Resolvers.Accounts.user_login/3)
    end

    @desc "Create an institute"
    field :create_institute, :institute_result do
      arg(:input, non_null(:institute_input))
      resolve(&Resolvers.Teaching.create_institute/3)
    end

    @desc "Edit an institute"
    field :edit_institute, :institute_result do
      arg(:id, non_null(:id))
      arg(:input, non_null(:institute_input))
      resolve(&Resolvers.Teaching.edit_institute/3)
    end

    @desc "Delete an institute"
    field :delete_institute, :institute_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Teaching.delete_institute/3)
    end
  end
end

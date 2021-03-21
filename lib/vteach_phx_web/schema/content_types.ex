defmodule VteachPhxWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :login_result do
    field :success, :boolean
    field :message, :string
    field :token, :string
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

  object :institute_result do
    field :institute, :institute
    field :success, :boolean
    field :message, :string
  end

  input_object :institute_input do
    field :name, :string
    field :email, :string
  end

  input_object :login_input do
    field :email, :string
    field :password, :string
  end
end

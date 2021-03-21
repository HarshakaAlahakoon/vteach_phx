defmodule VteachPhxWeb.Resolvers.Teaching do
  alias VteachPhx.Teaching
  alias Ecto.Changeset

  # NOTE: Institute related resolvers
  def list_institute(_, _, _) do
    {:ok, Teaching.list_institutes()}
  end

  def create_institute(_, %{input: params}, _) do
    case Teaching.create_institute(params) do
      {:ok, institute} ->
        {:ok,
         %{
           success: true,
           institute: institute
         }}

      {:error, changeset} ->
        {:error,
         %{
           success: false,
           details:
             Changeset.traverse_errors(
               changeset,
               fn {msg, _opts} ->
                 msg
               end
             )
         }}
    end
  end

  def edit_institute(_, %{id: id, input: params}, _) do
    with institute when institute != nil <- Teaching.get_institute(id) do
      case(Teaching.update_institute(institute, params)) do
        {:ok, new_institute} ->
          {:ok,
           %{
             success: true,
             institute: new_institute
           }}

        {:error, changeset} ->
          {:error,
           %{
             success: false,
             message:
               Changeset.traverse_errors(
                 changeset,
                 fn {msg, _params} ->
                   msg
                 end
               )
           }}
      end
    else
      nil ->
        {:error,
         %{
           success: false,
           message: "Institute not found"
         }}
    end
  end

  def delete_institute(_, %{id: id}, _) do
    with institute when institute != nil <- Teaching.get_institute(id) do
      case(Teaching.delete_institute(institute)) do
        {:ok, institute} ->
          {:ok,
           %{
             success: true,
             message: "Institute deleted",
             institute: institute
           }}

        {:error, changeset} ->
          {:error,
           %{
             success: false,
             message:
               Changeset.traverse_errors(
                 changeset,
                 fn {msg, _params} ->
                   msg
                 end
               )
           }}
      end
    else
      nil ->
        {:error,
         %{
           success: false,
           message: "Institute not found"
         }}
    end
  end

  # NOTE: UserInstitute related resolvers
  def list_user_institutes(_, _, _) do
    {:ok, Teaching.list_user_institutes()}
  end
end

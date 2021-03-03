defmodule VteachPhx.Teaching do
  @moduledoc """
  The Teaching context.
  """

  import Ecto.Query, warn: false
  alias VteachPhx.Repo

  alias VteachPhx.Teaching.Institute
  alias VteachPhx.Teaching.UserInstitute

  @doc """
  Returns the list of institutes.

  ## Examples

      iex> list_institute()
      [%Institute{}, ...]

  """
  def list_institutes do
    Repo.all(Institute)
  end

  @doc """
  Gets a single institute.

  Raises `Ecto.NoResultsError` if the Institute does not exist.

  ## Examples

      iex> get_institute!(123)
      %Institute{}

      iex> get_institute!(456)
      ** (Ecto.NoResultsError)

  """
  def get_institute!(id), do: Repo.get!(Institute, id)

  @doc """
  Creates a institute.

  ## Examples

      iex> create_institute(%{field: value})
      {:ok, %Institute{}}

      iex> create_institute(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_institute(attrs \\ %{}) do
    %Institute{}
    |> Institute.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a institute.

  ## Examples

      iex> update_institute(institute, %{field: new_value})
      {:ok, %Institute{}}

      iex> update_institute(institute, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_institute(%Institute{} = institute, attrs) do
    institute
    |> Institute.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a institute.

  ## Examples

      iex> delete_institute(institute)
      {:ok, %Institute{}}

      iex> delete_institute(institute)
      {:error, %Ecto.Changeset{}}

  """
  def delete_institute(%Institute{} = institute) do
    Repo.delete(institute)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking institute changes.

  ## Examples

      iex> change_institute(institute)
      %Ecto.Changeset{data: %Institute{}}

  """
  def change_institute(%Institute{} = institute, attrs \\ %{}) do
    Institute.changeset(institute, attrs)
  end

  alias VteachPhx.Teaching.UserInstitute

  @doc """
  Returns the list of user_institute.

  ## Examples

      iex> list_user_institute()
      [%UserInstitute{}, ...]

  """
  def list_user_institutes do
    Repo.all(UserInstitute)
  end

  @doc """
  Gets a single user_institute.

  Raises `Ecto.NoResultsError` if the User institutes does not exist.

  ## Examples

      iex> get_user_institute!(123)
      %UserInstitute{}

      iex> get_user_institute!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_institute!(id), do: Repo.get!(UserInstitute, id)

  def get_user_institutes_by_user_id(user_id) do
    IO.inspect(user_id)
    UserInstitute
    |> where(user_id: ^user_id)
    |> Repo.all()
  end

  @doc """
  Creates a user_institute.

  ## Examples

      iex> create_user_institute(%{field: value})
      {:ok, %UserInstitute{}}

      iex> create_user_institute(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_institute(attrs \\ %{}) do
    %UserInstitute{}
    |> UserInstitute.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_institute.

  ## Examples

      iex> update_user_institute(user_institute, %{field: new_value})
      {:ok, %UserInstitute{}}

      iex> update_user_institute(user_institute, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_institute(%UserInstitute{} = user_institute, attrs) do
    user_institute
    |> UserInstitute.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_institute.

  ## Examples

      iex> delete_user_institute(user_institute)
      {:ok, %UserInstitute{}}

      iex> delete_user_institute(user_institute)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_institute(%UserInstitute{} = user_institute) do
    Repo.delete(user_institute)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_institute changes.

  ## Examples

      iex> change_user_institute(user_institute)
      %Ecto.Changeset{data: %UserInstitute{}}

  """
  def change_user_institute(%UserInstitute{} = user_institute, attrs \\ %{}) do
    UserInstitute.changeset(user_institute, attrs)
  end
end

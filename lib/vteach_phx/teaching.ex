defmodule VteachPhx.Teaching do
  @moduledoc """
  The Teaching context.
  """

  import Ecto.Query, warn: false
  alias VteachPhx.Repo

  alias VteachPhx.Teaching.Institute

  @doc """
  Returns the list of institutes.

  ## Examples

      iex> list_institutes()
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
end

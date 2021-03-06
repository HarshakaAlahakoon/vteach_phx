defmodule VteachPhx.TeachingTest do
  use VteachPhx.DataCase

  alias VteachPhx.Teaching

  describe "institutes" do
    alias VteachPhx.Teaching.Institute

    @valid_attrs %{address_line_1: "some address_line_1", address_line_2: "some address_line_2", district: 42, email: "some email", fax: "some fax", name: "some name", phone: "some phone", province: 42}
    @update_attrs %{address_line_1: "some updated address_line_1", address_line_2: "some updated address_line_2", district: 43, email: "some updated email", fax: "some updated fax", name: "some updated name", phone: "some updated phone", province: 43}
    @invalid_attrs %{address_line_1: nil, address_line_2: nil, district: nil, email: nil, fax: nil, name: nil, phone: nil, province: nil}

    def institute_fixture(attrs \\ %{}) do
      {:ok, institute} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Teaching.create_institute()

      institute
    end

    test "list_institutes/0 returns all institutes" do
      institute = institute_fixture()
      assert Teaching.list_institutes() == [institute]
    end

    test "get_institute!/1 returns the institute with given id" do
      institute = institute_fixture()
      assert Teaching.get_institute!(institute.id) == institute
    end

    test "create_institute/1 with valid data creates a institute" do
      assert {:ok, %Institute{} = institute} = Teaching.create_institute(@valid_attrs)
      assert institute.address_line_1 == "some address_line_1"
      assert institute.address_line_2 == "some address_line_2"
      assert institute.district == 42
      assert institute.email == "some email"
      assert institute.fax == "some fax"
      assert institute.name == "some name"
      assert institute.phone == "some phone"
      assert institute.province == 42
    end

    test "create_institute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teaching.create_institute(@invalid_attrs)
    end

    test "update_institute/2 with valid data updates the institute" do
      institute = institute_fixture()
      assert {:ok, %Institute{} = institute} = Teaching.update_institute(institute, @update_attrs)
      assert institute.address_line_1 == "some updated address_line_1"
      assert institute.address_line_2 == "some updated address_line_2"
      assert institute.district == 43
      assert institute.email == "some updated email"
      assert institute.fax == "some updated fax"
      assert institute.name == "some updated name"
      assert institute.phone == "some updated phone"
      assert institute.province == 43
    end

    test "update_institute/2 with invalid data returns error changeset" do
      institute = institute_fixture()
      assert {:error, %Ecto.Changeset{}} = Teaching.update_institute(institute, @invalid_attrs)
      assert institute == Teaching.get_institute!(institute.id)
    end

    test "delete_institute/1 deletes the institute" do
      institute = institute_fixture()
      assert {:ok, %Institute{}} = Teaching.delete_institute(institute)
      assert_raise Ecto.NoResultsError, fn -> Teaching.get_institute!(institute.id) end
    end

    test "change_institute/1 returns a institute changeset" do
      institute = institute_fixture()
      assert %Ecto.Changeset{} = Teaching.change_institute(institute)
    end
  end
end

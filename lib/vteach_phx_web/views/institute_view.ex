defmodule VteachPhxWeb.InstituteView do
  use VteachPhxWeb, :view
  alias VteachPhxWeb.InstituteView

  def render("index.json", %{institutes: institutes}) do
    %{data: render_many(institutes, InstituteView, "institute.json")}
  end

  def render("show.json", %{institute: institute}) do
    %{data: render_one(institute, InstituteView, "institute.json")}
  end

  def render("institute.json", %{institute: institute}) do
    %{id: institute.id,
      name: institute.name,
      address_line_1: institute.address_line_1,
      address_line_2: institute.address_line_2,
      district: institute.district,
      province: institute.province,
      phone: institute.phone,
      fax: institute.fax,
      email: institute.email}
  end
end

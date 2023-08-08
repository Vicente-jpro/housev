require 'rails_helper'

RSpec.describe "favorite_lands/new", type: :view do
  before(:each) do
    assign(:favorite_land, FavoriteLand.new(
      profile: nil,
      land: nil
    ))
  end

  it "renders new favorite_land form" do
    render

    assert_select "form[action=?][method=?]", favorite_lands_path, "post" do

      assert_select "input[name=?]", "favorite_land[profile_id]"

      assert_select "input[name=?]", "favorite_land[land_id]"
    end
  end
end

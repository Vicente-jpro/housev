require 'rails_helper'

RSpec.describe "favorite_lands/edit", type: :view do
  let(:favorite_land) {
    FavoriteLand.create!(
      profile: nil,
      land: nil
    )
  }

  before(:each) do
    assign(:favorite_land, favorite_land)
  end

  it "renders the edit favorite_land form" do
    render

    assert_select "form[action=?][method=?]", favorite_land_path(favorite_land), "post" do

      assert_select "input[name=?]", "favorite_land[profile_id]"

      assert_select "input[name=?]", "favorite_land[land_id]"
    end
  end
end

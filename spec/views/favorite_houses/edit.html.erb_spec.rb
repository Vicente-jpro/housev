require 'rails_helper'

RSpec.describe "favorite_houses/edit", type: :view do
  let(:favorite_house) {
    FavoriteHouse.create!(
      profile: nil,
      house: nil
    )
  }

  before(:each) do
    assign(:favorite_house, favorite_house)
  end

  it "renders the edit favorite_house form" do
    render

    assert_select "form[action=?][method=?]", favorite_house_path(favorite_house), "post" do

      assert_select "input[name=?]", "favorite_house[profile_id]"

      assert_select "input[name=?]", "favorite_house[house_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "favorite_houses/new", type: :view do
  before(:each) do
    assign(:favorite_house, FavoriteHouse.new(
      profile: nil,
      house: nil
    ))
  end

  it "renders new favorite_house form" do
    render

    assert_select "form[action=?][method=?]", favorite_houses_path, "post" do

      assert_select "input[name=?]", "favorite_house[profile_id]"

      assert_select "input[name=?]", "favorite_house[house_id]"
    end
  end
end

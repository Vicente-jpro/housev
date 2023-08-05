require 'rails_helper'

RSpec.describe "profile_lands/edit", type: :view do
  let(:profile_land) {
    ProfileLand.create!(
      profile: nil,
      land: nil
    )
  }

  before(:each) do
    assign(:profile_land, profile_land)
  end

  it "renders the edit profile_land form" do
    render

    assert_select "form[action=?][method=?]", profile_land_path(profile_land), "post" do

      assert_select "input[name=?]", "profile_land[profile_id]"

      assert_select "input[name=?]", "profile_land[land_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "profile_lands/new", type: :view do
  before(:each) do
    assign(:profile_land, ProfileLand.new(
      profile: nil,
      land: nil
    ))
  end

  it "renders new profile_land form" do
    render

    assert_select "form[action=?][method=?]", profile_lands_path, "post" do

      assert_select "input[name=?]", "profile_land[profile_id]"

      assert_select "input[name=?]", "profile_land[land_id]"
    end
  end
end

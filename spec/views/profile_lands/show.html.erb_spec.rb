require 'rails_helper'

RSpec.describe "profile_lands/show", type: :view do
  before(:each) do
    assign(:profile_land, ProfileLand.create!(
      profile: nil,
      land: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

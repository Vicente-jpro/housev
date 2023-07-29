require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    assign(:profile, Profile.create!(
      name_profile: "Name Profile",
      phone1: "Phone1",
      phone2: "Phone2",
      profile_type: "Profile Type",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Profile/)
    expect(rendered).to match(/Phone1/)
    expect(rendered).to match(/Phone2/)
    expect(rendered).to match(/Profile Type/)
    expect(rendered).to match(//)
  end
end

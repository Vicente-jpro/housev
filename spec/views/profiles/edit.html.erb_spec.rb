require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  let(:profile) {
    Profile.create!(
      name_profile: "MyString",
      phone1: "MyString",
      phone2: "MyString",
      profile_type: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:profile, profile)
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(profile), "post" do

      assert_select "input[name=?]", "profile[name_profile]"

      assert_select "input[name=?]", "profile[phone1]"

      assert_select "input[name=?]", "profile[phone2]"

      assert_select "input[name=?]", "profile[profile_type]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
